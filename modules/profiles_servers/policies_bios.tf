#_________________________________________________________________________
#
# Intersight BIOS Policies Variables
# GUI Location: Configure > Policies > Create Policy > BIOS > Start
#_________________________________________________________________________

variable "policies_bios" {
  default = {
    default = {
      bios_policy  = "virtual_node"
      description  = ""
      organization = "default"
      tags         = []
    }
  }
  description = <<-EOT
  key - Name of the BIOS Policy
  * bios_policy - Name of the Best Practice BIOS Policy to Assign.
    - nvmeof
    - virtual_node
    - virtual_rack
  * description - Description to Assign to the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      bios_policy  = optional(string)
      description  = optional(string)
      organization = optional(string)
      tags         = optional(list(map(string)))
    }
  ))
}


module "policies_bios_nvmeof" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/policies_bios"
  for_each = {
    for k, v in local.policies_bios : k => v
    if local.policies_bios[k].bios_policy == "nvmeof"
  }
  description = each.value.description != "" ? each.value.description : "${each.key} BIOS Policy."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [for s in sort(keys(
  local.ucs_server_profiles)) : module.ucs_server_profiles[s].moid if local.ucs_server_profiles[s].profile.policies_bios == each.key]
  #+++++++++++++++++++++++++++++++
  # Intel Directed IO Section
  #+++++++++++++++++++++++++++++++
  intel_vt_for_directed_io      = "enabled" # Intel VT for Directed IO
  intel_vtd_coherency_support   = "enabled" # Intel(R) VT-d Coherency Support
  intel_vtd_interrupt_remapping = "enabled" # Intel(R) VT-d interrupt Remapping
  #+++++++++++++++++++++++++++++++
  # LOM and PCIe Slots Section
  #+++++++++++++++++++++++++++++++
  cdn_support         = "enabled"  # CDN Support for LOM
  lom_ports_all_state = "disabled" # All Onboard LOM Ports
  #+++++++++++++++++++++++++++++++
  # Memory Section
  #+++++++++++++++++++++++++++++++
  select_memory_ras_configuration = "maximum-performance" # Memory RAS Configuration
  #+++++++++++++++++++++++++++++++
  # PCI Section
  #+++++++++++++++++++++++++++++++
  memory_mapped_io_above4gb = "enabled" # Memory Mapped IO Above 4GiB
  #+++++++++++++++++++++++++++++++
  # Processor Section
  #+++++++++++++++++++++++++++++++
  altitude                        = "auto"        # Altitude
  cpu_energy_performance          = "performance" # Energy Performance
  cpu_frequency_floor             = "enabled"     # Frequency Floor Override
  cpu_power_management            = "performance" # Power Technology
  direct_cache_access             = "enabled"     # Direct Cache Access Support
  dram_clock_throttling           = "Performance" # DRAM Clock Throttling
  intel_virtualization_technology = "enabled"     # Intel(R) VT
  processor_c1e                   = "disabled"    # Processor C1E
  processor_c3report              = "disabled"    # Processor C3 Report
  processor_c6report              = "disabled"    # Processor C6 Report
  processor_cstate                = "disabled"    # CPU C State
  #+++++++++++++++++++++++++++++++
  # Serial Port Section
  #+++++++++++++++++++++++++++++++
  serial_port_aenable = "enabled" # Serial A Enable
  #+++++++++++++++++++++++++++++++
  # Server Management Section
  #+++++++++++++++++++++++++++++++
  cdn_enable            = "enabled"       # Consistent Device Naming
  console_redirection   = "serial-port-a" # Console Redirection
  out_of_band_mgmt_port = "enabled"       # Out-of-Band Mgmt Port
  #+++++++++++++++++++++++++++++++
  # Trusted Platform Section
  #+++++++++++++++++++++++++++++++
  txt_support = "enabled" # Intel Trusted Execution Technology Support
}

module "policies_bios_virtual_node" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/policies_bios"
  for_each = {
    for k, v in local.policies_bios : k => v
    if local.policies_bios[k].bios_policy == "virtual_node"
  }
  description = each.value.description != "" ? each.value.description : "${each.key} BIOS Policy."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.policies_bios == each.key
  ]
  #+++++++++++++++++++++++++++++++
  # Boot Options Section
  #+++++++++++++++++++++++++++++++
  vmd_enable = "enabled" # VMD Enablement
  #+++++++++++++++++++++++++++++++
  # Intel Directed IO Section
  #+++++++++++++++++++++++++++++++
  intel_vt_for_directed_io      = "enabled" # Intel VT for Directed IO
  intel_vtd_coherency_support   = "enabled" # Intel(R) VT-d Coherency Support
  intel_vtd_interrupt_remapping = "enabled" # Intel(R) VT-d interrupt Remapping
  #+++++++++++++++++++++++++++++++
  # LOM and PCIe Slots Section
  #+++++++++++++++++++++++++++++++
  cdn_support = "enabled" # CDN Support for LOM
  # lom_ports_all_state = "disabled" # All Onboard LOM Ports
  #+++++++++++++++++++++++++++++++
  # Memory Section
  #+++++++++++++++++++++++++++++++
  select_memory_ras_configuration = "maximum-performance" # Memory RAS Configuration
  #+++++++++++++++++++++++++++++++
  # PCI Section
  #+++++++++++++++++++++++++++++++
  memory_mapped_io_above4gb = "enabled" # Memory Mapped IO Above 4GiB
  #+++++++++++++++++++++++++++++++
  # Processor Section
  #+++++++++++++++++++++++++++++++
  altitude                        = "auto"        # Altitude
  cpu_energy_performance          = "performance" # Energy Performance
  cpu_performance                 = "hpc"         # CPU Performance
  cpu_frequency_floor             = "enabled"     # Frequency Floor Override
  cpu_power_management            = "custom"      # Power Technology
  direct_cache_access             = "enabled"     # Direct Cache Access Support
  dram_clock_throttling           = "Performance" # DRAM Clock Throttling
  imc_interleave                  = "Auto"        # IMC Interleaving
  intel_virtualization_technology = "enabled"     # Intel(R) VT
  llc_prefetch                    = "disabled"    # LLC Prefetch
  processor_c1e                   = "disabled"    # Processor C1E
  processor_c3report              = "disabled"    # Processor C3 Report
  processor_c6report              = "disabled"    # Processor C6 Report
  processor_cstate                = "disabled"    # CPU C State
  snc                             = "disabled"    # Sub Numa Clustering
  xpt_prefetch                    = "disabled"    # XPT Prefetch
  #+++++++++++++++++++++++++++++++
  # Server Management Section
  #+++++++++++++++++++++++++++++++
  cdn_enable = "enabled" # Consistent Device Naming
  #+++++++++++++++++++++++++++++++
  # Trusted Platform Section
  #+++++++++++++++++++++++++++++++
  txt_support = "enabled" # Intel Trusted Execution Technology Support
}

module "policies_bios_virtual_rack" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/policies_bios"
  for_each = {
    for k, v in local.policies_bios : k => v
    if local.policies_bios[k].bios_policy == "virtual_rack"
  }
  description = each.value.description != "" ? each.value.description : "${each.key} BIOS Policy."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.policies_bios == each.key
  ]
  #+++++++++++++++++++++++++++++++
  # Boot Options Section
  #+++++++++++++++++++++++++++++++
  vmd_enable = "enabled" # VMD Enablement
  #+++++++++++++++++++++++++++++++
  # Intel Directed IO Section
  #+++++++++++++++++++++++++++++++
  intel_vt_for_directed_io      = "enabled" # Intel VT for Directed IO
  intel_vtd_coherency_support   = "enabled" # Intel(R) VT-d Coherency Support
  intel_vtd_interrupt_remapping = "enabled" # Intel(R) VT-d interrupt Remapping
  #+++++++++++++++++++++++++++++++
  # LOM and PCIe Slots Section
  #+++++++++++++++++++++++++++++++
  cdn_support         = "enabled"  # CDN Support for LOM
  lom_ports_all_state = "disabled" # All Onboard LOM Ports
  #+++++++++++++++++++++++++++++++
  # Memory Section
  #+++++++++++++++++++++++++++++++
  select_memory_ras_configuration = "maximum-performance" # Memory RAS Configuration
  #+++++++++++++++++++++++++++++++
  # PCI Section
  #+++++++++++++++++++++++++++++++
  memory_mapped_io_above4gb = "enabled" # Memory Mapped IO Above 4GiB
  #+++++++++++++++++++++++++++++++
  # Processor Section
  #+++++++++++++++++++++++++++++++
  altitude                        = "auto"        # Altitude
  cpu_energy_performance          = "performance" # Energy Performance
  cpu_performance                 = "hpc"         # CPU Performance
  cpu_frequency_floor             = "enabled"     # Frequency Floor Override
  cpu_power_management            = "custom"      # Power Technology
  direct_cache_access             = "enabled"     # Direct Cache Access Support
  dram_clock_throttling           = "Performance" # DRAM Clock Throttling
  imc_interleave                  = "Auto"        # IMC Interleaving
  intel_virtualization_technology = "enabled"     # Intel(R) VT
  llc_prefetch                    = "disabled"    # LLC Prefetch
  processor_c1e                   = "disabled"    # Processor C1E
  processor_c3report              = "disabled"    # Processor C3 Report
  processor_c6report              = "disabled"    # Processor C6 Report
  processor_cstate                = "disabled"    # CPU C State
  snc                             = "disabled"    # Sub Numa Clustering
  xpt_prefetch                    = "disabled"    # XPT Prefetch
  #+++++++++++++++++++++++++++++++
  # Serial Port Section
  #+++++++++++++++++++++++++++++++
  serial_port_aenable = "enabled" # Serial A Enable
  #+++++++++++++++++++++++++++++++
  # Server Management Section
  #+++++++++++++++++++++++++++++++
  cdn_enable            = "enabled"       # Consistent Device Naming
  console_redirection   = "serial-port-a" # Console Redirection
  out_of_band_mgmt_port = "enabled"       # Out-of-Band Mgmt Port
  #+++++++++++++++++++++++++++++++
  # Trusted Platform Section
  #+++++++++++++++++++++++++++++++
  txt_support = "enabled" # Intel Trusted Execution Technology Support
}



#____________________________________________________________
#
# BIOS Policies
# GUI Location: Policies > Create Policy: BIOS
#____________________________________________________________

variable "policies_bios_custom" {
  default = {
    default = {
      description                           = ""
      organization                          = "organization"
      profiles                              = []
      tags                                  = []
      boot_option_num_retry                 = "platform-default"
      boot_option_re_cool_down              = "platform-default"
      boot_option_retry                     = "platform-default"
      ipv4http                              = "platform-default"
      ipv4pxe                               = "platform-default"
      ipv6http                              = "platform-default"
      ipv6pxe                               = "platform-default"
      network_stack                         = "platform-default"
      onboard_scu_storage_support           = "platform-default"
      onboard_scu_storage_sw_stack          = "platform-default"
      pop_support                           = "platform-default"
      psata                                 = "platform-default"
      sata_mode_select                      = "platform-default"
      vmd_enable                            = "platform-default"
      intel_vt_for_directed_io              = "platform-default"
      intel_vtd_coherency_support           = "platform-default"
      intel_vtd_interrupt_remapping         = "platform-default"
      intel_vtd_pass_through_dma_support    = "platform-default"
      intel_vtdats_support                  = "platform-default"
      acs_control_gpu1state                 = "platform-default"
      acs_control_gpu2state                 = "platform-default"
      acs_control_gpu3state                 = "platform-default"
      acs_control_gpu4state                 = "platform-default"
      acs_control_gpu5state                 = "platform-default"
      acs_control_gpu6state                 = "platform-default"
      acs_control_gpu7state                 = "platform-default"
      acs_control_gpu8state                 = "platform-default"
      acs_control_slot11state               = "platform-default"
      acs_control_slot12state               = "platform-default"
      acs_control_slot13state               = "platform-default"
      acs_control_slot14state               = "platform-default"
      cdn_support                           = "platform-default"
      edpc_en                               = "platform-default"
      enable_clock_spread_spec              = "platform-default"
      lom_port0state                        = "platform-default"
      lom_port1state                        = "platform-default"
      lom_port2state                        = "platform-default"
      lom_port3state                        = "platform-default"
      lom_ports_all_state                   = "platform-default"
      pci_option_ro_ms                      = "platform-default"
      pci_rom_clp                           = "platform-default"
      pcie_ari_support                      = "platform-default"
      pcie_pll_ssc                          = "platform-default"
      pcie_slot_mraid1link_speed            = "platform-default"
      pcie_slot_mraid1option_rom            = "platform-default"
      pcie_slot_mraid2link_speed            = "platform-default"
      pcie_slot_mraid2option_rom            = "platform-default"
      pcie_slot_mstorraid_link_speed        = "platform-default"
      pcie_slot_mstorraid_option_rom        = "platform-default"
      pcie_slot_nvme1link_speed             = "platform-default"
      pcie_slot_nvme1option_rom             = "platform-default"
      pcie_slot_nvme2link_speed             = "platform-default"
      pcie_slot_nvme2option_rom             = "platform-default"
      pcie_slot_nvme3link_speed             = "platform-default"
      pcie_slot_nvme3option_rom             = "platform-default"
      pcie_slot_nvme4link_speed             = "platform-default"
      pcie_slot_nvme4option_rom             = "platform-default"
      pcie_slot_nvme5link_speed             = "platform-default"
      pcie_slot_nvme5option_rom             = "platform-default"
      pcie_slot_nvme6link_speed             = "platform-default"
      pcie_slot_nvme6option_rom             = "platform-default"
      slot10link_speed                      = "platform-default"
      slot10state                           = "platform-default"
      slot11link_speed                      = "platform-default"
      slot11state                           = "platform-default"
      slot12link_speed                      = "platform-default"
      slot12state                           = "platform-default"
      slot13state                           = "platform-default"
      slot14state                           = "platform-default"
      slot1link_speed                       = "platform-default"
      slot1state                            = "platform-default"
      slot2link_speed                       = "platform-default"
      slot2state                            = "platform-default"
      slot3link_speed                       = "platform-default"
      slot3state                            = "platform-default"
      slot4link_speed                       = "platform-default"
      slot4state                            = "platform-default"
      slot5link_speed                       = "platform-default"
      slot5state                            = "platform-default"
      slot6link_speed                       = "platform-default"
      slot6state                            = "platform-default"
      slot7link_speed                       = "platform-default"
      slot7state                            = "platform-default"
      slot8link_speed                       = "platform-default"
      slot8state                            = "platform-default"
      slot9link_speed                       = "platform-default"
      slot9state                            = "platform-default"
      slot_flom_link_speed                  = "platform-default"
      slot_front_nvme10link_speed           = "platform-default"
      slot_front_nvme10option_rom           = "platform-default"
      slot_front_nvme11link_speed           = "platform-default"
      slot_front_nvme11option_rom           = "platform-default"
      slot_front_nvme12link_speed           = "platform-default"
      slot_front_nvme12option_rom           = "platform-default"
      slot_front_nvme13option_rom           = "platform-default"
      slot_front_nvme14option_rom           = "platform-default"
      slot_front_nvme15option_rom           = "platform-default"
      slot_front_nvme16option_rom           = "platform-default"
      slot_front_nvme17option_rom           = "platform-default"
      slot_front_nvme18option_rom           = "platform-default"
      slot_front_nvme19option_rom           = "platform-default"
      slot_front_nvme1link_speed            = "platform-default"
      slot_front_nvme1option_rom            = "platform-default"
      slot_front_nvme20option_rom           = "platform-default"
      slot_front_nvme21option_rom           = "platform-default"
      slot_front_nvme22option_rom           = "platform-default"
      slot_front_nvme23option_rom           = "platform-default"
      slot_front_nvme24option_rom           = "platform-default"
      slot_front_nvme2link_speed            = "platform-default"
      slot_front_nvme2option_rom            = "platform-default"
      slot_front_nvme3link_speed            = "platform-default"
      slot_front_nvme3option_rom            = "platform-default"
      slot_front_nvme4link_speed            = "platform-default"
      slot_front_nvme4option_rom            = "platform-default"
      slot_front_nvme5link_speed            = "platform-default"
      slot_front_nvme5option_rom            = "platform-default"
      slot_front_nvme6link_speed            = "platform-default"
      slot_front_nvme6option_rom            = "platform-default"
      slot_front_nvme7link_speed            = "platform-default"
      slot_front_nvme7option_rom            = "platform-default"
      slot_front_nvme8link_speed            = "platform-default"
      slot_front_nvme8option_rom            = "platform-default"
      slot_front_nvme9link_speed            = "platform-default"
      slot_front_nvme9option_rom            = "platform-default"
      slot_front_slot5link_speed            = "platform-default"
      slot_front_slot6link_speed            = "platform-default"
      slot_gpu1state                        = "platform-default"
      slot_gpu2state                        = "platform-default"
      slot_gpu3state                        = "platform-default"
      slot_gpu4state                        = "platform-default"
      slot_gpu5state                        = "platform-default"
      slot_gpu6state                        = "platform-default"
      slot_gpu7state                        = "platform-default"
      slot_gpu8state                        = "platform-default"
      slot_hba_link_speed                   = "platform-default"
      slot_hba_state                        = "platform-default"
      slot_lom1link                         = "platform-default"
      slot_lom2link                         = "platform-default"
      slot_mezz_state                       = "platform-default"
      slot_mlom_link_speed                  = "platform-default"
      slot_mlom_state                       = "platform-default"
      slot_mraid_link_speed                 = "platform-default"
      slot_mraid_state                      = "platform-default"
      slot_n10state                         = "platform-default"
      slot_n11state                         = "platform-default"
      slot_n12state                         = "platform-default"
      slot_n13state                         = "platform-default"
      slot_n14state                         = "platform-default"
      slot_n15state                         = "platform-default"
      slot_n16state                         = "platform-default"
      slot_n17state                         = "platform-default"
      slot_n18state                         = "platform-default"
      slot_n19state                         = "platform-default"
      slot_n1state                          = "platform-default"
      slot_n20state                         = "platform-default"
      slot_n21state                         = "platform-default"
      slot_n22state                         = "platform-default"
      slot_n23state                         = "platform-default"
      slot_n24state                         = "platform-default"
      slot_n2state                          = "platform-default"
      slot_n3state                          = "platform-default"
      slot_n4state                          = "platform-default"
      slot_n5state                          = "platform-default"
      slot_n6state                          = "platform-default"
      slot_n7state                          = "platform-default"
      slot_n8state                          = "platform-default"
      slot_n9state                          = "platform-default"
      slot_raid_link_speed                  = "platform-default"
      slot_raid_state                       = "platform-default"
      slot_rear_nvme1link_speed             = "platform-default"
      slot_rear_nvme1state                  = "platform-default"
      slot_rear_nvme2link_speed             = "platform-default"
      slot_rear_nvme2state                  = "platform-default"
      slot_rear_nvme3link_speed             = "platform-default"
      slot_rear_nvme3state                  = "platform-default"
      slot_rear_nvme4link_speed             = "platform-default"
      slot_rear_nvme4state                  = "platform-default"
      slot_rear_nvme5state                  = "platform-default"
      slot_rear_nvme6state                  = "platform-default"
      slot_rear_nvme7state                  = "platform-default"
      slot_rear_nvme8state                  = "platform-default"
      slot_riser1link_speed                 = "platform-default"
      slot_riser1slot1link_speed            = "platform-default"
      slot_riser1slot2link_speed            = "platform-default"
      slot_riser1slot3link_speed            = "platform-default"
      slot_riser2link_speed                 = "platform-default"
      slot_riser2slot4link_speed            = "platform-default"
      slot_riser2slot5link_speed            = "platform-default"
      slot_riser2slot6link_speed            = "platform-default"
      slot_sas_state                        = "platform-default"
      slot_ssd_slot1link_speed              = "platform-default"
      slot_ssd_slot2link_speed              = "platform-default"
      post_error_pause                      = "platform-default"
      tpm_support                           = "platform-default"
      advanced_mem_test                     = "platform-default"
      bme_dma_mitigation                    = "platform-default"
      burst_and_postponed_refresh           = "platform-default"
      cbs_cmn_cpu_smee                      = "platform-default"
      cbs_cmn_gnb_nb_iommu                  = "platform-default"
      cbs_cmn_mem_ctrl_bank_group_swap_ddr4 = "platform-default"
      cbs_cmn_mem_map_bank_interleave_ddr4  = "platform-default"
      cbs_dbg_cpu_snp_mem_cover             = "platform-default"
      cbs_dbg_cpu_snp_mem_size_cover        = "platform-default"
      cbs_df_cmn_dram_nps                   = "platform-default"
      cbs_df_cmn_mem_intlv                  = "platform-default"
      cbs_df_cmn_mem_intlv_size             = "platform-default"
      cbs_sev_snp_support                   = "platform-default"
      cke_low_policy                        = "platform-default"
      cr_qos                                = "platform-default"
      crfastgo_config                       = "platform-default"
      dcpmm_firmware_downgrade              = "platform-default"
      dram_refresh_rate                     = "platform-default"
      dram_sw_thermal_throttling            = "platform-default"
      eadr_support                          = "platform-default"
      lv_ddr_mode                           = "platform-default"
      memory_bandwidth_boost                = "platform-default"
      memory_refresh_rate                   = "platform-default"
      memory_size_limit                     = "platform-default"
      memory_thermal_throttling             = "platform-default"
      mirroring_mode                        = "platform-default"
      numa_optimized                        = "platform-default"
      nvmdimm_perform_config                = "platform-default"
      operation_mode                        = "platform-default"
      panic_high_watermark                  = "platform-default"
      partial_cache_line_sparing            = "platform-default"
      partial_mirror_mode_config            = "platform-default"
      partial_mirror_percent                = "platform-default"
      partial_mirror_value1                 = "platform-default"
      partial_mirror_value2                 = "platform-default"
      partial_mirror_value3                 = "platform-default"
      partial_mirror_value4                 = "platform-default"
      pc_ie_ras_support                     = "platform-default"
      post_package_repair                   = "platform-default"
      select_memory_ras_configuration       = "platform-default"
      select_ppr_type                       = "platform-default"
      sev                                   = "platform-default"
      smee                                  = "platform-default"
      snoopy_mode_for2lm                    = "platform-default"
      snoopy_mode_for_ad                    = "platform-default"
      sparing_mode                          = "platform-default"
      tsme                                  = "platform-default"
      uma_based_clustering                  = "platform-default"
      vol_memory_mode                       = "platform-default"
      aspm_support                          = "platform-default"
      ioh_resource                          = "platform-default"
      memory_mapped_io_above4gb             = "platform-default"
      mmcfg_base                            = "platform-default"
      onboard10gbit_lom                     = "platform-default"
      onboard_gbit_lom                      = "platform-default"
      pc_ie_ssd_hot_plug_support            = "platform-default"
      sr_iov                                = "platform-default"
      vga_priority                          = "platform-default"
      cbs_cmn_cpu_cpb                       = "platform-default"
      cbs_cmn_cpu_global_cstate_ctrl        = "platform-default"
      cbs_cmn_cpu_l1stream_hw_prefetcher    = "platform-default"
      cbs_cmn_cpu_l2stream_hw_prefetcher    = "platform-default"
      cbs_cmn_determinism_slider            = "platform-default"
      cbs_cmn_efficiency_mode_en            = "platform-default"
      cbs_cmn_gnb_smucppc                   = "platform-default"
      cbs_cmnc_tdp_ctl                      = "platform-default"
      adjacent_cache_line_prefetch          = "platform-default"
      altitude                              = "platform-default"
      auto_cc_state                         = "platform-default"
      autonumous_cstate_enable              = "platform-default"
      boot_performance_mode                 = "platform-default"
      cbs_cmn_apbdis                        = "platform-default"
      cbs_cmn_cpu_gen_downcore_ctrl         = "platform-default"
      cbs_cmn_cpu_streaming_stores_ctrl     = "platform-default"
      cbs_cmn_fixed_soc_pstate              = "platform-default"
      cbs_cmn_gnb_smu_df_cstates            = "platform-default"
      cbs_cpu_ccd_ctrl_ssp                  = "platform-default"
      cbs_cpu_core_ctrl                     = "platform-default"
      cbs_cpu_smt_ctrl                      = "platform-default"
      cbs_df_cmn_acpi_srat_l3numa           = "platform-default"
      channel_inter_leave                   = "platform-default"
      cisco_xgmi_max_speed                  = "platform-default"
      closed_loop_therm_throtl              = "platform-default"
      cmci_enable                           = "platform-default"
      config_tdp                            = "platform-default"
      config_tdp_level                      = "platform-default"
      core_multi_processing                 = "platform-default"
      cpu_energy_performance                = "platform-default"
      cpu_frequency_floor                   = "platform-default"
      cpu_performance                       = "platform-default"
      cpu_power_management                  = "platform-default"
      demand_scrub                          = "platform-default"
      direct_cache_access                   = "platform-default"
      dram_clock_throttling                 = "platform-default"
      energy_efficient_turbo                = "platform-default"
      eng_perf_tuning                       = "platform-default"
      enhanced_intel_speed_step_tech        = "platform-default"
      epp_enable                            = "platform-default"
      epp_profile                           = "platform-default"
      execute_disable_bit                   = "platform-default"
      extended_apic                         = "platform-default"
      hardware_prefetch                     = "platform-default"
      hwpm_enable                           = "platform-default"
      imc_interleave                        = "platform-default"
      intel_dynamic_speed_select            = "platform-default"
      intel_hyper_threading_tech            = "platform-default"
      intel_speed_select                    = "platform-default"
      intel_turbo_boost_tech                = "platform-default"
      intel_virtualization_technology       = "platform-default"
      ioh_error_enable                      = "platform-default"
      ip_prefetch                           = "platform-default"
      kti_prefetch                          = "platform-default"
      llc_prefetch                          = "platform-default"
      memory_inter_leave                    = "platform-default"
      package_cstate_limit                  = "platform-default"
      patrol_scrub                          = "platform-default"
      patrol_scrub_duration                 = "platform-default"
      processor_c1e                         = "platform-default"
      processor_c3report                    = "platform-default"
      processor_c6report                    = "platform-default"
      processor_cstate                      = "platform-default"
      pstate_coord_type                     = "platform-default"
      pwr_perf_tuning                       = "platform-default"
      qpi_link_speed                        = "platform-default"
      rank_inter_leave                      = "platform-default"
      single_pctl_enable                    = "platform-default"
      smt_mode                              = "platform-default"
      snc                                   = "platform-default"
      streamer_prefetch                     = "platform-default"
      svm_mode                              = "platform-default"
      ufs_disable                           = "platform-default"
      work_load_config                      = "platform-default"
      xpt_prefetch                          = "platform-default"
      qpi_link_frequency                    = "platform-default"
      qpi_snoop_mode                        = "platform-default"
      serial_port_aenable                   = "platform-default"
      assert_nmi_on_perr                    = "platform-default"
      assert_nmi_on_serr                    = "platform-default"
      baud_rate                             = "platform-default"
      cdn_enable                            = "platform-default"
      cisco_adaptive_mem_training           = "platform-default"
      cisco_debug_level                     = "platform-default"
      cisco_oprom_launch_optimization       = "platform-default"
      console_redirection                   = "platform-default"
      flow_control                          = "platform-default"
      frb2enable                            = "platform-default"
      legacy_os_redirection                 = "platform-default"
      os_boot_watchdog_timer                = "platform-default"
      os_boot_watchdog_timer_policy         = "platform-default"
      os_boot_watchdog_timer_timeout        = "platform-default"
      out_of_band_mgmt_port                 = "platform-default"
      putty_key_pad                         = "platform-default"
      redirection_after_post                = "platform-default"
      terminal_type                         = "platform-default"
      ucsm_boot_order_rule                  = "platform-default"
      enable_mktme                          = "platform-default"
      enable_sgx                            = "platform-default"
      enable_tme                            = "platform-default"
      epoch_update                          = "platform-default"
      sgx_auto_registration_agent           = "platform-default"
      sgx_epoch0                            = "platform-default"
      sgx_epoch1                            = "platform-default"
      sgx_factory_reset                     = "platform-default"
      sgx_le_pub_key_hash0                  = "platform-default"
      sgx_le_pub_key_hash1                  = "platform-default"
      sgx_le_pub_key_hash2                  = "platform-default"
      sgx_le_pub_key_hash3                  = "platform-default"
      sgx_le_wr                             = "platform-default"
      sgx_package_info_in_band_access       = "platform-default"
      sgx_qos                               = "platform-default"
      tpm_control                           = "platform-default"
      tpm_pending_operation                 = "platform-default"
      txt_support                           = "platform-default"
      all_usb_devices                       = "platform-default"
      legacy_usb_support                    = "platform-default"
      make_device_non_bootable              = "platform-default"
      pch_usb30mode                         = "platform-default"
      usb_emul6064                          = "platform-default"
      usb_port_front                        = "platform-default"
      usb_port_internal                     = "platform-default"
      usb_port_kvm                          = "platform-default"
      usb_port_rear                         = "platform-default"
      usb_port_sd_card                      = "platform-default"
      usb_port_vmedia                       = "platform-default"
      usb_xhci_support                      = "platform-default"
    }
  }
  description = <<-EOT
  Intersight UCS Domain Profile Variable Map.
  1. organization - Name of the Intersight Organization to assign this BIOS Policy to:
    * https://intersight.com/an/settings/organizations/
  2. For the remainder of the option documentation refer to these sources:
    * https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/policies_bios
  EOT
  type = map(object(
    {
      description                           = optional(string)
      organization                          = optional(string)
      name                                  = optional(string)
      profiles                              = optional(list(string))
      tags                                  = optional(list(map(string)))
      boot_option_num_retry                 = optional(string)
      boot_option_re_cool_down              = optional(string)
      boot_option_retry                     = optional(string)
      ipv4http                              = optional(string)
      ipv4pxe                               = optional(string)
      ipv6http                              = optional(string)
      ipv6pxe                               = optional(string)
      network_stack                         = optional(string)
      onboard_scu_storage_support           = optional(string)
      onboard_scu_storage_sw_stack          = optional(string)
      pop_support                           = optional(string)
      psata                                 = optional(string)
      sata_mode_select                      = optional(string)
      vmd_enable                            = optional(string)
      intel_vt_for_directed_io              = optional(string)
      intel_vtd_coherency_support           = optional(string)
      intel_vtd_interrupt_remapping         = optional(string)
      intel_vtd_pass_through_dma_support    = optional(string)
      intel_vtdats_support                  = optional(string)
      acs_control_gpu1state                 = optional(string)
      acs_control_gpu2state                 = optional(string)
      acs_control_gpu3state                 = optional(string)
      acs_control_gpu4state                 = optional(string)
      acs_control_gpu5state                 = optional(string)
      acs_control_gpu6state                 = optional(string)
      acs_control_gpu7state                 = optional(string)
      acs_control_gpu8state                 = optional(string)
      acs_control_slot11state               = optional(string)
      acs_control_slot12state               = optional(string)
      acs_control_slot13state               = optional(string)
      acs_control_slot14state               = optional(string)
      cdn_support                           = optional(string)
      edpc_en                               = optional(string)
      enable_clock_spread_spec              = optional(string)
      lom_port0state                        = optional(string)
      lom_port1state                        = optional(string)
      lom_port2state                        = optional(string)
      lom_port3state                        = optional(string)
      lom_ports_all_state                   = optional(string)
      pci_option_ro_ms                      = optional(string)
      pci_rom_clp                           = optional(string)
      pcie_ari_support                      = optional(string)
      pcie_pll_ssc                          = optional(string)
      pcie_slot_mraid1link_speed            = optional(string)
      pcie_slot_mraid1option_rom            = optional(string)
      pcie_slot_mraid2link_speed            = optional(string)
      pcie_slot_mraid2option_rom            = optional(string)
      pcie_slot_mstorraid_link_speed        = optional(string)
      pcie_slot_mstorraid_option_rom        = optional(string)
      pcie_slot_nvme1link_speed             = optional(string)
      pcie_slot_nvme1option_rom             = optional(string)
      pcie_slot_nvme2link_speed             = optional(string)
      pcie_slot_nvme2option_rom             = optional(string)
      pcie_slot_nvme3link_speed             = optional(string)
      pcie_slot_nvme3option_rom             = optional(string)
      pcie_slot_nvme4link_speed             = optional(string)
      pcie_slot_nvme4option_rom             = optional(string)
      pcie_slot_nvme5link_speed             = optional(string)
      pcie_slot_nvme5option_rom             = optional(string)
      pcie_slot_nvme6link_speed             = optional(string)
      pcie_slot_nvme6option_rom             = optional(string)
      slot10link_speed                      = optional(string)
      slot10state                           = optional(string)
      slot11link_speed                      = optional(string)
      slot11state                           = optional(string)
      slot12link_speed                      = optional(string)
      slot12state                           = optional(string)
      slot13state                           = optional(string)
      slot14state                           = optional(string)
      slot1link_speed                       = optional(string)
      slot1state                            = optional(string)
      slot2link_speed                       = optional(string)
      slot2state                            = optional(string)
      slot3link_speed                       = optional(string)
      slot3state                            = optional(string)
      slot4link_speed                       = optional(string)
      slot4state                            = optional(string)
      slot5link_speed                       = optional(string)
      slot5state                            = optional(string)
      slot6link_speed                       = optional(string)
      slot6state                            = optional(string)
      slot7link_speed                       = optional(string)
      slot7state                            = optional(string)
      slot8link_speed                       = optional(string)
      slot8state                            = optional(string)
      slot9link_speed                       = optional(string)
      slot9state                            = optional(string)
      slot_flom_link_speed                  = optional(string)
      slot_front_nvme10link_speed           = optional(string)
      slot_front_nvme10option_rom           = optional(string)
      slot_front_nvme11link_speed           = optional(string)
      slot_front_nvme11option_rom           = optional(string)
      slot_front_nvme12link_speed           = optional(string)
      slot_front_nvme12option_rom           = optional(string)
      slot_front_nvme13option_rom           = optional(string)
      slot_front_nvme14option_rom           = optional(string)
      slot_front_nvme15option_rom           = optional(string)
      slot_front_nvme16option_rom           = optional(string)
      slot_front_nvme17option_rom           = optional(string)
      slot_front_nvme18option_rom           = optional(string)
      slot_front_nvme19option_rom           = optional(string)
      slot_front_nvme1link_speed            = optional(string)
      slot_front_nvme1option_rom            = optional(string)
      slot_front_nvme20option_rom           = optional(string)
      slot_front_nvme21option_rom           = optional(string)
      slot_front_nvme22option_rom           = optional(string)
      slot_front_nvme23option_rom           = optional(string)
      slot_front_nvme24option_rom           = optional(string)
      slot_front_nvme2link_speed            = optional(string)
      slot_front_nvme2option_rom            = optional(string)
      slot_front_nvme3link_speed            = optional(string)
      slot_front_nvme3option_rom            = optional(string)
      slot_front_nvme4link_speed            = optional(string)
      slot_front_nvme4option_rom            = optional(string)
      slot_front_nvme5link_speed            = optional(string)
      slot_front_nvme5option_rom            = optional(string)
      slot_front_nvme6link_speed            = optional(string)
      slot_front_nvme6option_rom            = optional(string)
      slot_front_nvme7link_speed            = optional(string)
      slot_front_nvme7option_rom            = optional(string)
      slot_front_nvme8link_speed            = optional(string)
      slot_front_nvme8option_rom            = optional(string)
      slot_front_nvme9link_speed            = optional(string)
      slot_front_nvme9option_rom            = optional(string)
      slot_front_slot5link_speed            = optional(string)
      slot_front_slot6link_speed            = optional(string)
      slot_gpu1state                        = optional(string)
      slot_gpu2state                        = optional(string)
      slot_gpu3state                        = optional(string)
      slot_gpu4state                        = optional(string)
      slot_gpu5state                        = optional(string)
      slot_gpu6state                        = optional(string)
      slot_gpu7state                        = optional(string)
      slot_gpu8state                        = optional(string)
      slot_hba_link_speed                   = optional(string)
      slot_hba_state                        = optional(string)
      slot_lom1link                         = optional(string)
      slot_lom2link                         = optional(string)
      slot_mezz_state                       = optional(string)
      slot_mlom_link_speed                  = optional(string)
      slot_mlom_state                       = optional(string)
      slot_mraid_link_speed                 = optional(string)
      slot_mraid_state                      = optional(string)
      slot_n10state                         = optional(string)
      slot_n11state                         = optional(string)
      slot_n12state                         = optional(string)
      slot_n13state                         = optional(string)
      slot_n14state                         = optional(string)
      slot_n15state                         = optional(string)
      slot_n16state                         = optional(string)
      slot_n17state                         = optional(string)
      slot_n18state                         = optional(string)
      slot_n19state                         = optional(string)
      slot_n1state                          = optional(string)
      slot_n20state                         = optional(string)
      slot_n21state                         = optional(string)
      slot_n22state                         = optional(string)
      slot_n23state                         = optional(string)
      slot_n24state                         = optional(string)
      slot_n2state                          = optional(string)
      slot_n3state                          = optional(string)
      slot_n4state                          = optional(string)
      slot_n5state                          = optional(string)
      slot_n6state                          = optional(string)
      slot_n7state                          = optional(string)
      slot_n8state                          = optional(string)
      slot_n9state                          = optional(string)
      slot_raid_link_speed                  = optional(string)
      slot_raid_state                       = optional(string)
      slot_rear_nvme1link_speed             = optional(string)
      slot_rear_nvme1state                  = optional(string)
      slot_rear_nvme2link_speed             = optional(string)
      slot_rear_nvme2state                  = optional(string)
      slot_rear_nvme3link_speed             = optional(string)
      slot_rear_nvme3state                  = optional(string)
      slot_rear_nvme4link_speed             = optional(string)
      slot_rear_nvme4state                  = optional(string)
      slot_rear_nvme5state                  = optional(string)
      slot_rear_nvme6state                  = optional(string)
      slot_rear_nvme7state                  = optional(string)
      slot_rear_nvme8state                  = optional(string)
      slot_riser1link_speed                 = optional(string)
      slot_riser1slot1link_speed            = optional(string)
      slot_riser1slot2link_speed            = optional(string)
      slot_riser1slot3link_speed            = optional(string)
      slot_riser2link_speed                 = optional(string)
      slot_riser2slot4link_speed            = optional(string)
      slot_riser2slot5link_speed            = optional(string)
      slot_riser2slot6link_speed            = optional(string)
      slot_sas_state                        = optional(string)
      slot_ssd_slot1link_speed              = optional(string)
      slot_ssd_slot2link_speed              = optional(string)
      post_error_pause                      = optional(string)
      tpm_support                           = optional(string)
      advanced_mem_test                     = optional(string)
      bme_dma_mitigation                    = optional(string)
      burst_and_postponed_refresh           = optional(string)
      cbs_cmn_cpu_smee                      = optional(string)
      cbs_cmn_gnb_nb_iommu                  = optional(string)
      cbs_cmn_mem_ctrl_bank_group_swap_ddr4 = optional(string)
      cbs_cmn_mem_map_bank_interleave_ddr4  = optional(string)
      cbs_dbg_cpu_snp_mem_cover             = optional(string)
      cbs_dbg_cpu_snp_mem_size_cover        = optional(string)
      cbs_df_cmn_dram_nps                   = optional(string)
      cbs_df_cmn_mem_intlv                  = optional(string)
      cbs_df_cmn_mem_intlv_size             = optional(string)
      cbs_sev_snp_support                   = optional(string)
      cke_low_policy                        = optional(string)
      cr_qos                                = optional(string)
      crfastgo_config                       = optional(string)
      dcpmm_firmware_downgrade              = optional(string)
      dram_refresh_rate                     = optional(string)
      dram_sw_thermal_throttling            = optional(string)
      eadr_support                          = optional(string)
      lv_ddr_mode                           = optional(string)
      memory_bandwidth_boost                = optional(string)
      memory_refresh_rate                   = optional(string)
      memory_size_limit                     = optional(string)
      memory_thermal_throttling             = optional(string)
      mirroring_mode                        = optional(string)
      numa_optimized                        = optional(string)
      nvmdimm_perform_config                = optional(string)
      operation_mode                        = optional(string)
      panic_high_watermark                  = optional(string)
      partial_cache_line_sparing            = optional(string)
      partial_mirror_mode_config            = optional(string)
      partial_mirror_percent                = optional(string)
      partial_mirror_value1                 = optional(string)
      partial_mirror_value2                 = optional(string)
      partial_mirror_value3                 = optional(string)
      partial_mirror_value4                 = optional(string)
      pc_ie_ras_support                     = optional(string)
      post_package_repair                   = optional(string)
      select_memory_ras_configuration       = optional(string)
      select_ppr_type                       = optional(string)
      sev                                   = optional(string)
      smee                                  = optional(string)
      snoopy_mode_for2lm                    = optional(string)
      snoopy_mode_for_ad                    = optional(string)
      sparing_mode                          = optional(string)
      tsme                                  = optional(string)
      uma_based_clustering                  = optional(string)
      vol_memory_mode                       = optional(string)
      aspm_support                          = optional(string)
      ioh_resource                          = optional(string)
      memory_mapped_io_above4gb             = optional(string)
      mmcfg_base                            = optional(string)
      onboard10gbit_lom                     = optional(string)
      onboard_gbit_lom                      = optional(string)
      pc_ie_ssd_hot_plug_support            = optional(string)
      sr_iov                                = optional(string)
      vga_priority                          = optional(string)
      cbs_cmn_cpu_cpb                       = optional(string)
      cbs_cmn_cpu_global_cstate_ctrl        = optional(string)
      cbs_cmn_cpu_l1stream_hw_prefetcher    = optional(string)
      cbs_cmn_cpu_l2stream_hw_prefetcher    = optional(string)
      cbs_cmn_determinism_slider            = optional(string)
      cbs_cmn_efficiency_mode_en            = optional(string)
      cbs_cmn_gnb_smucppc                   = optional(string)
      cbs_cmnc_tdp_ctl                      = optional(string)
      adjacent_cache_line_prefetch          = optional(string)
      altitude                              = optional(string)
      auto_cc_state                         = optional(string)
      autonumous_cstate_enable              = optional(string)
      boot_performance_mode                 = optional(string)
      cbs_cmn_apbdis                        = optional(string)
      cbs_cmn_cpu_gen_downcore_ctrl         = optional(string)
      cbs_cmn_cpu_streaming_stores_ctrl     = optional(string)
      cbs_cmn_fixed_soc_pstate              = optional(string)
      cbs_cmn_gnb_smu_df_cstates            = optional(string)
      cbs_cpu_ccd_ctrl_ssp                  = optional(string)
      cbs_cpu_core_ctrl                     = optional(string)
      cbs_cpu_smt_ctrl                      = optional(string)
      cbs_df_cmn_acpi_srat_l3numa           = optional(string)
      channel_inter_leave                   = optional(string)
      cisco_xgmi_max_speed                  = optional(string)
      closed_loop_therm_throtl              = optional(string)
      cmci_enable                           = optional(string)
      config_tdp                            = optional(string)
      config_tdp_level                      = optional(string)
      core_multi_processing                 = optional(string)
      cpu_energy_performance                = optional(string)
      cpu_frequency_floor                   = optional(string)
      cpu_performance                       = optional(string)
      cpu_power_management                  = optional(string)
      demand_scrub                          = optional(string)
      direct_cache_access                   = optional(string)
      dram_clock_throttling                 = optional(string)
      energy_efficient_turbo                = optional(string)
      eng_perf_tuning                       = optional(string)
      enhanced_intel_speed_step_tech        = optional(string)
      epp_enable                            = optional(string)
      epp_profile                           = optional(string)
      execute_disable_bit                   = optional(string)
      extended_apic                         = optional(string)
      hardware_prefetch                     = optional(string)
      hwpm_enable                           = optional(string)
      imc_interleave                        = optional(string)
      intel_dynamic_speed_select            = optional(string)
      intel_hyper_threading_tech            = optional(string)
      intel_speed_select                    = optional(string)
      intel_turbo_boost_tech                = optional(string)
      intel_virtualization_technology       = optional(string)
      ioh_error_enable                      = optional(string)
      ip_prefetch                           = optional(string)
      kti_prefetch                          = optional(string)
      llc_prefetch                          = optional(string)
      memory_inter_leave                    = optional(string)
      package_cstate_limit                  = optional(string)
      patrol_scrub                          = optional(string)
      patrol_scrub_duration                 = optional(string)
      processor_c1e                         = optional(string)
      processor_c3report                    = optional(string)
      processor_c6report                    = optional(string)
      processor_cstate                      = optional(string)
      pstate_coord_type                     = optional(string)
      pwr_perf_tuning                       = optional(string)
      qpi_link_speed                        = optional(string)
      rank_inter_leave                      = optional(string)
      single_pctl_enable                    = optional(string)
      smt_mode                              = optional(string)
      snc                                   = optional(string)
      streamer_prefetch                     = optional(string)
      svm_mode                              = optional(string)
      ufs_disable                           = optional(string)
      work_load_config                      = optional(string)
      xpt_prefetch                          = optional(string)
      qpi_link_frequency                    = optional(string)
      qpi_snoop_mode                        = optional(string)
      serial_port_aenable                   = optional(string)
      assert_nmi_on_perr                    = optional(string)
      assert_nmi_on_serr                    = optional(string)
      baud_rate                             = optional(string)
      cdn_enable                            = optional(string)
      cisco_adaptive_mem_training           = optional(string)
      cisco_debug_level                     = optional(string)
      cisco_oprom_launch_optimization       = optional(string)
      console_redirection                   = optional(string)
      flow_control                          = optional(string)
      frb2enable                            = optional(string)
      legacy_os_redirection                 = optional(string)
      os_boot_watchdog_timer                = optional(string)
      os_boot_watchdog_timer_policy         = optional(string)
      os_boot_watchdog_timer_timeout        = optional(string)
      out_of_band_mgmt_port                 = optional(string)
      putty_key_pad                         = optional(string)
      redirection_after_post                = optional(string)
      terminal_type                         = optional(string)
      ucsm_boot_order_rule                  = optional(string)
      enable_mktme                          = optional(string)
      enable_sgx                            = optional(string)
      enable_tme                            = optional(string)
      epoch_update                          = optional(string)
      sgx_auto_registration_agent           = optional(string)
      sgx_epoch0                            = optional(string)
      sgx_epoch1                            = optional(string)
      sgx_factory_reset                     = optional(string)
      sgx_le_pub_key_hash0                  = optional(string)
      sgx_le_pub_key_hash1                  = optional(string)
      sgx_le_pub_key_hash2                  = optional(string)
      sgx_le_pub_key_hash3                  = optional(string)
      sgx_le_wr                             = optional(string)
      sgx_package_info_in_band_access       = optional(string)
      sgx_qos                               = optional(string)
      tpm_control                           = optional(string)
      tpm_pending_operation                 = optional(string)
      txt_support                           = optional(string)
      all_usb_devices                       = optional(string)
      legacy_usb_support                    = optional(string)
      make_device_non_bootable              = optional(string)
      pch_usb30mode                         = optional(string)
      usb_emul6064                          = optional(string)
      usb_port_front                        = optional(string)
      usb_port_internal                     = optional(string)
      usb_port_kvm                          = optional(string)
      usb_port_rear                         = optional(string)
      usb_port_sd_card                      = optional(string)
      usb_port_vmedia                       = optional(string)
      usb_xhci_support                      = optional(string)
    }
  ))
}

# module "bios_custom" {
#   depends_on = [
#     local.org_moids,
#     module.ucs_server_profiles
#   ]
#   source      = "terraform-cisco-modules/imm/intersight//modules/policies_bios"
#   for_each = {
#     for assign, bios_custom in local.bios_custom : assign => bios_custom
#     if bios_custom.create == true
#   }
#   description = each.value.description
#   name        = each.value.name
#   org_moid    = local.org_moids[organization].moid
#   profiles     = [ for s in sort(keys(local.bios_custom_profiles)) : module.ucs_server_profiles[s].moid ]
#   tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
#   #+++++++++++++++++++++++++++++++
#   # Boot Options Section
#   #+++++++++++++++++++++++++++++++
#   boot_option_num_retry        = each.value.boot_option_num_retry        # Number of Retries
#   boot_option_re_cool_down     = each.value.boot_option_re_cool_down     # Cool Down Time (sec)
#   boot_option_retry            = each.value.boot_option_retry            # Boot Option Retry
#   ipv4http                     = each.value.ipv4http                     # IPv4 HTTP Support
#   ipv4pxe                      = each.value.ipv4pxe                      # IPv4 PXE Support
#   ipv6http                     = each.value.ipv6http                     # IPv6 HTTP Support
#   ipv6pxe                      = each.value.ipv6pxe                      # IPv6 PXE Support
#   network_stack                = each.value.network_stack                # Network Stack
#   onboard_scu_storage_support  = each.value.onboard_scu_storage_support  # Onboard SCU Storage Support
#   onboard_scu_storage_sw_stack = each.value.onboard_scu_storage_sw_stack # Onboard SCU Storage SW Stack
#   pop_support                  = each.value.pop_support                  # Power ON Password
#   psata                        = each.value.psata                        # P-SATA Mode
#   sata_mode_select             = each.value.sata_mode_select             # SATA Mode
#   vmd_enable                   = each.value.vmd_enable                   # VMD Enablement
#   #+++++++++++++++++++++++++++++++
#   # Intel Directed IO Section
#   #+++++++++++++++++++++++++++++++
#   intel_vt_for_directed_io           = each.value.intel_vt_for_directed_io           # Intel VT for Directed IO
#   intel_vtd_coherency_support        = each.value.intel_vtd_coherency_support        # Intel(R) VT-d Coherency Support
#   intel_vtd_interrupt_remapping      = each.value.intel_vtd_interrupt_remapping      # Intel(R) VT-d interrupt Remapping
#   intel_vtd_pass_through_dma_support = each.value.intel_vtd_pass_through_dma_support # Intel(R) VT-d PassThrough DMA Support
#   intel_vtdats_support               = each.value.intel_vtdats_support               # Intel VTD ATS Support
#   #+++++++++++++++++++++++++++++++
#   # LOM and PCIe Slots Section
#   #+++++++++++++++++++++++++++++++
#   acs_control_gpu1state          = each.value.acs_control_gpu1state          # ACS Control GPU 1
#   acs_control_gpu2state          = each.value.acs_control_gpu2state          # ACS Control GPU 2
#   acs_control_gpu3state          = each.value.acs_control_gpu3state          # ACS Control GPU 3
#   acs_control_gpu4state          = each.value.acs_control_gpu4state          # ACS Control GPU 4
#   acs_control_gpu5state          = each.value.acs_control_gpu5state          # ACS Control GPU 5
#   acs_control_gpu6state          = each.value.acs_control_gpu6state          # ACS Control GPU 6
#   acs_control_gpu7state          = each.value.acs_control_gpu7state          # ACS Control GPU 7
#   acs_control_gpu8state          = each.value.acs_control_gpu8state          # ACS Control GPU 8
#   acs_control_slot11state        = each.value.acs_control_slot11state        # ACS Control Slot 11
#   acs_control_slot12state        = each.value.acs_control_slot12state        # ACS Control Slot 12
#   acs_control_slot13state        = each.value.acs_control_slot13state        # ACS Control Slot 13
#   acs_control_slot14state        = each.value.acs_control_slot14state        # ACS Control Slot 14
#   cdn_support                    = each.value.cdn_support                    # CDN Support for LOM
#   edpc_en                        = each.value.edpc_en                        # IIO eDPC Support
#   enable_clock_spread_spec       = each.value.enable_clock_spread_spec       # External SSC Enable
#   lom_port0state                 = each.value.lom_port0state                 # LOM Port 0 OptionROM
#   lom_port1state                 = each.value.lom_port1state                 # LOM Port 1 OptionROM
#   lom_port2state                 = each.value.lom_port2state                 # LOM Port 2 OptionROM
#   lom_port3state                 = each.value.lom_port3state                 # LOM Port 3 OptionROM
#   lom_ports_all_state            = each.value.lom_ports_all_state            # All Onboard LOM Ports
#   pci_option_ro_ms               = each.value.pci_option_ro_ms               # All PCIe Slots OptionROM
#   pci_rom_clp                    = each.value.pci_rom_clp                    # PCI ROM CLP
#   pcie_ari_support               = each.value.pcie_ari_support               # PCI ARI Support
#   pcie_pll_ssc                   = each.value.pcie_pll_ssc                   # PCI PLL SSC
#   pcie_slot_mraid1link_speed     = each.value.pcie_slot_mraid1link_speed     # MRAID1 Link Speed
#   pcie_slot_mraid1option_rom     = each.value.pcie_slot_mraid1option_rom     # MRAID1 OptionROM
#   pcie_slot_mraid2link_speed     = each.value.pcie_slot_mraid2link_speed     # MRAID2 Link Speed
#   pcie_slot_mraid2option_rom     = each.value.pcie_slot_mraid2option_rom     # MRAID2 OptionROM
#   pcie_slot_mstorraid_link_speed = each.value.pcie_slot_mstorraid_link_speed # PCIe Slot MSTOR Link Speed
#   pcie_slot_mstorraid_option_rom = each.value.pcie_slot_mstorraid_option_rom # PCIe Slot MSTOR RAID OptionROM
#   pcie_slot_nvme1link_speed      = each.value.pcie_slot_nvme1link_speed      # NVME 1 Link Speed
#   pcie_slot_nvme1option_rom      = each.value.pcie_slot_nvme1option_rom      # NVME 1 OptionROM
#   pcie_slot_nvme2link_speed      = each.value.pcie_slot_nvme2link_speed      # NVME 2 Link Speed
#   pcie_slot_nvme2option_rom      = each.value.pcie_slot_nvme2option_rom      # NVME 2 OptionROM
#   pcie_slot_nvme3link_speed      = each.value.pcie_slot_nvme3link_speed      # NVME 3 Link Speed
#   pcie_slot_nvme3option_rom      = each.value.pcie_slot_nvme3option_rom      # NVME 3 OptionROM
#   pcie_slot_nvme4link_speed      = each.value.pcie_slot_nvme4link_speed      # NVME 4 Link Speed
#   pcie_slot_nvme4option_rom      = each.value.pcie_slot_nvme4option_rom      # NVME 4 OptionROM
#   pcie_slot_nvme5link_speed      = each.value.pcie_slot_nvme5link_speed      # NVME 5 Link Speed
#   pcie_slot_nvme5option_rom      = each.value.pcie_slot_nvme5option_rom      # NVME 5 OptionROM
#   pcie_slot_nvme6link_speed      = each.value.pcie_slot_nvme6link_speed      # NVME 6 Link Speed
#   pcie_slot_nvme6option_rom      = each.value.pcie_slot_nvme6option_rom      # NVME 6 OptionROM
#   slot10link_speed               = each.value.slot10link_speed               # PCIe Slot:10 Link Speed
#   slot10state                    = each.value.slot10state                    # Slot 10 State
#   slot11link_speed               = each.value.slot11link_speed               # PCIe Slot:11 Link Speed
#   slot11state                    = each.value.slot11state                    # Slot 11 State
#   slot12link_speed               = each.value.slot12link_speed               # PCIe Slot:12 Link Speed
#   slot12state                    = each.value.slot12state                    # Slot 12 State
#   slot13state                    = each.value.slot13state                    # Slot 13 State
#   slot14state                    = each.value.slot14state                    # Slot 14 State
#   slot1link_speed                = each.value.slot1link_speed                # PCIe Slot: 1 Link Speed
#   slot1state                     = each.value.slot1state                     # Slot 1 State
#   slot2link_speed                = each.value.slot2link_speed                # PCIe Slot: 2 Link Speed
#   slot2state                     = each.value.slot2state                     # Slot 2 State
#   slot3link_speed                = each.value.slot3link_speed                # PCIe Slot: 3 Link Speed
#   slot3state                     = each.value.slot3state                     # Slot 3 State
#   slot4link_speed                = each.value.slot4link_speed                # PCIe Slot: 4 Link Speed
#   slot4state                     = each.value.slot4state                     # Slot 4 State
#   slot5link_speed                = each.value.slot5link_speed                # PCIe Slot: 5 Link Speed
#   slot5state                     = each.value.slot5state                     # Slot 5 State
#   slot6link_speed                = each.value.slot6link_speed                # PCIe Slot: 6 Link Speed
#   slot6state                     = each.value.slot6state                     # Slot 6 State
#   slot7link_speed                = each.value.slot7link_speed                # PCIe Slot: 7 Link Speed
#   slot7state                     = each.value.slot7state                     # Slot 7 State
#   slot8link_speed                = each.value.slot8link_speed                # PCIe Slot: 8 Link Speed
#   slot8state                     = each.value.slot8state                     # Slot 8 State
#   slot9link_speed                = each.value.slot9link_speed                # PCIe Slot: 9 Link Speed
#   slot9state                     = each.value.slot9state                     # Slot 9 State
#   slot_flom_link_speed           = each.value.slot_flom_link_speed           # PCIe Slot:FLOM Link Speed
#   slot_front_nvme10link_speed    = each.value.slot_front_nvme10link_speed    # Front NVME 10 Link Speed
#   slot_front_nvme10option_rom    = each.value.slot_front_nvme10option_rom    # Front NVME 10 OptionROM
#   slot_front_nvme11link_speed    = each.value.slot_front_nvme11link_speed    # Front NVME 11 Link Speed
#   slot_front_nvme11option_rom    = each.value.slot_front_nvme11option_rom    # Front NVME 11 OptionROM
#   slot_front_nvme12link_speed    = each.value.slot_front_nvme12link_speed    # Front NVME 12 Link Speed
#   slot_front_nvme12option_rom    = each.value.slot_front_nvme12option_rom    # Front NVME 12 OptionROM
#   slot_front_nvme13option_rom    = each.value.slot_front_nvme13option_rom    # Front NVME 13 OptionROM
#   slot_front_nvme14option_rom    = each.value.slot_front_nvme14option_rom    # Front NVME 14 OptionROM
#   slot_front_nvme15option_rom    = each.value.slot_front_nvme15option_rom    # Front NVME 15 OptionROM
#   slot_front_nvme16option_rom    = each.value.slot_front_nvme16option_rom    # Front NVME 16 OptionROM
#   slot_front_nvme17option_rom    = each.value.slot_front_nvme17option_rom    # Front NVME 17 OptionROM
#   slot_front_nvme18option_rom    = each.value.slot_front_nvme18option_rom    # Front NVME 18 OptionROM
#   slot_front_nvme19option_rom    = each.value.slot_front_nvme19option_rom    # Front NVME 19 OptionROM
#   slot_front_nvme1link_speed     = each.value.slot_front_nvme1link_speed     # PCIe Slot:Front NVME 1 Link Speed
#   slot_front_nvme1option_rom     = each.value.slot_front_nvme1option_rom     # Front NVME 1 OptionROM
#   slot_front_nvme20option_rom    = each.value.slot_front_nvme20option_rom    # Front NVME 20 OptionROM
#   slot_front_nvme21option_rom    = each.value.slot_front_nvme21option_rom    # Front NVME 21 OptionROM
#   slot_front_nvme22option_rom    = each.value.slot_front_nvme22option_rom    # Front NVME 22 OptionROM
#   slot_front_nvme23option_rom    = each.value.slot_front_nvme23option_rom    # Front NVME 23 OptionROM
#   slot_front_nvme24option_rom    = each.value.slot_front_nvme24option_rom    # Front NVME 24 OptionROM
#   slot_front_nvme2link_speed     = each.value.slot_front_nvme2link_speed     # PCIe Slot:Front NVME 2 Link Speed
#   slot_front_nvme2option_rom     = each.value.slot_front_nvme2option_rom     # Front NVME 2 OptionROM
#   slot_front_nvme3link_speed     = each.value.slot_front_nvme3link_speed     # Front NVME 3 Link Speed
#   slot_front_nvme3option_rom     = each.value.slot_front_nvme3option_rom     # Front NVME 3 OptionROM
#   slot_front_nvme4link_speed     = each.value.slot_front_nvme4link_speed     # Front NVME 4 Link Speed
#   slot_front_nvme4option_rom     = each.value.slot_front_nvme4option_rom     # Front NVME 4 OptionROM
#   slot_front_nvme5link_speed     = each.value.slot_front_nvme5link_speed     # Front NVME 5 Link Speed
#   slot_front_nvme5option_rom     = each.value.slot_front_nvme5option_rom     # Front NVME 5 OptionROM
#   slot_front_nvme6link_speed     = each.value.slot_front_nvme6link_speed     # Front NVME 6 Link Speed
#   slot_front_nvme6option_rom     = each.value.slot_front_nvme6option_rom     # Front NVME 6 OptionROM
#   slot_front_nvme7link_speed     = each.value.slot_front_nvme7link_speed     # Front NVME 7 Link Speed
#   slot_front_nvme7option_rom     = each.value.slot_front_nvme7option_rom     # Front NVME 7 OptionROM
#   slot_front_nvme8link_speed     = each.value.slot_front_nvme8link_speed     # Front NVME 8 Link Speed
#   slot_front_nvme8option_rom     = each.value.slot_front_nvme8option_rom     # Front NVME 8 OptionROM
#   slot_front_nvme9link_speed     = each.value.slot_front_nvme9link_speed     # Front NVME 9 Link Speed
#   slot_front_nvme9option_rom     = each.value.slot_front_nvme9option_rom     # Front NVME 9 OptionROM
#   slot_front_slot5link_speed     = each.value.slot_front_slot5link_speed     # PCIe Slot:Front1 Link Speed
#   slot_front_slot6link_speed     = each.value.slot_front_slot6link_speed     # PCIe Slot:Front2 Link Speed
#   slot_gpu1state                 = each.value.slot_gpu1state                 # GPU 1 OptionROM
#   slot_gpu2state                 = each.value.slot_gpu2state                 # GPU 2 OptionROM
#   slot_gpu3state                 = each.value.slot_gpu3state                 # GPU 3 OptionROM
#   slot_gpu4state                 = each.value.slot_gpu4state                 # GPU 4 OptionROM
#   slot_gpu5state                 = each.value.slot_gpu5state                 # GPU 5 OptionROM
#   slot_gpu6state                 = each.value.slot_gpu6state                 # GPU 6 OptionROM
#   slot_gpu7state                 = each.value.slot_gpu7state                 # GPU 7 OptionROM
#   slot_gpu8state                 = each.value.slot_gpu8state                 # GPU 8 OptionROM
#   slot_hba_link_speed            = each.value.slot_hba_link_speed            # PCIe Slot:HBA Link Speed
#   slot_hba_state                 = each.value.slot_hba_state                 # PCIe Slot:HBA OptionROM
#   slot_lom1link                  = each.value.slot_lom1link                  # PCIe LOM:1 Link
#   slot_lom2link                  = each.value.slot_lom2link                  # PCIe LOM:2 Link
#   slot_mezz_state                = each.value.slot_mezz_state                # Slot Mezz State
#   slot_mlom_link_speed           = each.value.slot_mlom_link_speed           # PCIe Slot:MLOM Link Speed
#   slot_mlom_state                = each.value.slot_mlom_state                # PCIe Slot MLOM OptionROM
#   slot_mraid_link_speed          = each.value.slot_mraid_link_speed          # MRAID Link Speed
#   slot_mraid_state               = each.value.slot_mraid_state               # PCIe Slot MRAID OptionROM
#   slot_n10state                  = each.value.slot_n10state                  # PCIe Slot N10 OptionROM
#   slot_n11state                  = each.value.slot_n11state                  # PCIe Slot N11 OptionROM
#   slot_n12state                  = each.value.slot_n12state                  # PCIe Slot N12 OptionROM
#   slot_n13state                  = each.value.slot_n13state                  # PCIe Slot N13 OptionROM
#   slot_n14state                  = each.value.slot_n14state                  # PCIe Slot N14 OptionROM
#   slot_n15state                  = each.value.slot_n15state                  # PCIe Slot N15 OptionROM
#   slot_n16state                  = each.value.slot_n16state                  # PCIe Slot N16 OptionROM
#   slot_n17state                  = each.value.slot_n17state                  # PCIe Slot N17 OptionROM
#   slot_n18state                  = each.value.slot_n18state                  # PCIe Slot N18 OptionROM
#   slot_n19state                  = each.value.slot_n19state                  # PCIe Slot N19 OptionROM
#   slot_n1state                   = each.value.slot_n1state                   # PCIe Slot N1 OptionROM
#   slot_n20state                  = each.value.slot_n20state                  # PCIe Slot N20 OptionROM
#   slot_n21state                  = each.value.slot_n21state                  # PCIe Slot N21 OptionROM
#   slot_n22state                  = each.value.slot_n22state                  # PCIe Slot N22 OptionROM
#   slot_n23state                  = each.value.slot_n23state                  # PCIe Slot N23 OptionROM
#   slot_n24state                  = each.value.slot_n24state                  # PCIe Slot N24 OptionROM
#   slot_n2state                   = each.value.slot_n2state                   # PCIe Slot N2 OptionROM
#   slot_n3state                   = each.value.slot_n3state                   # PCIe Slot N3 OptionROM
#   slot_n4state                   = each.value.slot_n4state                   # PCIe Slot N4 OptionROM
#   slot_n5state                   = each.value.slot_n5state                   # PCIe Slot N5 OptionROM
#   slot_n6state                   = each.value.slot_n6state                   # PCIe Slot N6 OptionROM
#   slot_n7state                   = each.value.slot_n7state                   # PCIe Slot N7 OptionROM
#   slot_n8state                   = each.value.slot_n8state                   # PCIe Slot N8 OptionROM
#   slot_n9state                   = each.value.slot_n9state                   # PCIe Slot N9 OptionROM
#   slot_raid_link_speed           = each.value.slot_raid_link_speed           # RAID Link Speed
#   slot_raid_state                = each.value.slot_raid_state                # PCIe Slot RAID OptionROM
#   slot_rear_nvme1link_speed      = each.value.slot_rear_nvme1link_speed      # PCIe Slot:Rear NVME 1 Link Speed
#   slot_rear_nvme1state           = each.value.slot_rear_nvme1state           # PCIe Slot:Rear NVME 1 OptionROM
#   slot_rear_nvme2link_speed      = each.value.slot_rear_nvme2link_speed      # PCIe Slot:Rear NVME 2 Link Speed
#   slot_rear_nvme2state           = each.value.slot_rear_nvme2state           # PCIe Slot:Rear NVME 2 OptionROM
#   slot_rear_nvme3link_speed      = each.value.slot_rear_nvme3link_speed      # PCIe Slot:Rear NVME 3 Link Speed
#   slot_rear_nvme3state           = each.value.slot_rear_nvme3state           # PCIe Slot:Rear NVME 3 OptionROM
#   slot_rear_nvme4link_speed      = each.value.slot_rear_nvme4link_speed      # PCIe Slot:Rear NVME 4 Link Speed
#   slot_rear_nvme4state           = each.value.slot_rear_nvme4state           # PCIe Slot:Rear NVME 4 OptionROM
#   slot_rear_nvme5state           = each.value.slot_rear_nvme5state           # PCIe Slot:Rear NVME 5 OptionROM
#   slot_rear_nvme6state           = each.value.slot_rear_nvme6state           # PCIe Slot:Rear NVME 6 OptionROM
#   slot_rear_nvme7state           = each.value.slot_rear_nvme7state           # PCIe Slot:Rear NVME 7 OptionROM
#   slot_rear_nvme8state           = each.value.slot_rear_nvme8state           # PCIe Slot:Rear NVME 8 OptionROM
#   slot_riser1link_speed          = each.value.slot_riser1link_speed          # PCIe Slot:Riser1 Link Speed
#   slot_riser1slot1link_speed     = each.value.slot_riser1slot1link_speed     # PCIe Slot:Riser1 Slot1 Link Speed
#   slot_riser1slot2link_speed     = each.value.slot_riser1slot2link_speed     # PCIe Slot:Riser2 Slot1 Link Speed
#   slot_riser1slot3link_speed     = each.value.slot_riser1slot3link_speed     # PCIe Slot:Riser3 Slot1 Link Speed
#   slot_riser2link_speed          = each.value.slot_riser2link_speed          # PCIe Slot:Riser2 Link Speed
#   slot_riser2slot4link_speed     = each.value.slot_riser2slot4link_speed     # PCIe Slot:Riser2 Slot4 Link Speed
#   slot_riser2slot5link_speed     = each.value.slot_riser2slot5link_speed     # PCIe Slot:Riser2 Slot5 Link Speed
#   slot_riser2slot6link_speed     = each.value.slot_riser2slot6link_speed     # PCIe Slot:Riser2 Slot6 Link Speed
#   slot_sas_state                 = each.value.slot_sas_state                 # PCIe Slot:SAS OptionROM
#   slot_ssd_slot1link_speed       = each.value.slot_ssd_slot1link_speed       # PCIe Slot:FrontSSD1 Link Speed
#   slot_ssd_slot2link_speed       = each.value.slot_ssd_slot2link_speed       # PCIe Slot:FrontSSD2 Link Speed
#   #+++++++++++++++++++++++++++++++
#   # Main Section
#   #+++++++++++++++++++++++++++++++
#   post_error_pause = each.value.post_error_pause # POST Error Pause
#   tpm_support      = each.value.tpm_support      # TPM Support
#   #+++++++++++++++++++++++++++++++
#   # Memory Section
#   #+++++++++++++++++++++++++++++++
#   advanced_mem_test                     = each.value.advanced_mem_test                     # Enhanced Memory Test
#   bme_dma_mitigation                    = each.value.bme_dma_mitigation                    # BME DMA Mitigation
#   burst_and_postponed_refresh           = each.value.burst_and_postponed_refresh           # Burst and Postponed Refresh
#   cbs_cmn_cpu_smee                      = each.value.cbs_cmn_cpu_smee                      # CPU SMEE
#   cbs_cmn_gnb_nb_iommu                  = each.value.cbs_cmn_gnb_nb_iommu                  # IOMMU
#   cbs_cmn_mem_ctrl_bank_group_swap_ddr4 = each.value.cbs_cmn_mem_ctrl_bank_group_swap_ddr4 # Bank Group Swap
#   cbs_cmn_mem_map_bank_interleave_ddr4  = each.value.cbs_cmn_mem_map_bank_interleave_ddr4  # Chipset Interleave
#   cbs_dbg_cpu_snp_mem_cover             = each.value.cbs_dbg_cpu_snp_mem_cover             # SNP Memory Coverage
#   cbs_dbg_cpu_snp_mem_size_cover        = each.value.cbs_dbg_cpu_snp_mem_size_cover        # SNP Memory Size to Cover in MiB
#   cbs_df_cmn_dram_nps                   = each.value.cbs_df_cmn_dram_nps                   # NUMA Nodes per Socket
#   cbs_df_cmn_mem_intlv                  = each.value.cbs_df_cmn_mem_intlv                  # AMD Memory Interleaving
#   cbs_df_cmn_mem_intlv_size             = each.value.cbs_df_cmn_mem_intlv_size             # AMD Memory Interleaving Size
#   cbs_sev_snp_support                   = each.value.cbs_sev_snp_support                   # SEV-SNP Support
#   cke_low_policy                        = each.value.cke_low_policy                        # CKE Low Policy
#   cr_qos                                = each.value.cr_qos                                # CR QoS
#   crfastgo_config                       = each.value.crfastgo_config                       # CR FastGo Config
#   dcpmm_firmware_downgrade              = each.value.dcpmm_firmware_downgrade              # DCPMM Firmware Downgrade
#   dram_refresh_rate                     = each.value.dram_refresh_rate                     # DRAM Refresh Rate
#   dram_sw_thermal_throttling            = each.value.dram_sw_thermal_throttling            # DRAM SW Thermal Throttling
#   eadr_support                          = each.value.eadr_support                          # eADR Support
#   lv_ddr_mode                           = each.value.lv_ddr_mode                           # Low Voltage DDR Mode
#   memory_bandwidth_boost                = each.value.memory_bandwidth_boost                # Memory Bandwidth Boost
#   memory_refresh_rate                   = each.value.memory_refresh_rate                   # Memory Refresh Rate
#   memory_size_limit                     = each.value.memory_size_limit                     # Memory Size Limit in GiB
#   memory_thermal_throttling             = each.value.memory_thermal_throttling             # Memory Thermal Throttling Mode
#   mirroring_mode                        = each.value.mirroring_mode                        # Mirroring Mode
#   numa_optimized                        = each.value.numa_optimized                        # NUMA Optimized
#   nvmdimm_perform_config                = each.value.nvmdimm_perform_config                # NVM Performance Setting
#   operation_mode                        = each.value.operation_mode                        # Operation Mode
#   panic_high_watermark                  = each.value.panic_high_watermark                  # Panic and High Watermark
#   partial_cache_line_sparing            = each.value.partial_cache_line_sparing            # Partial Cache Line Sparing
#   partial_mirror_mode_config            = each.value.partial_mirror_mode_config            # Partial Memory Mirror Mode
#   partial_mirror_percent                = each.value.partial_mirror_percent                # Partial Mirror Percentage
#   partial_mirror_value1                 = each.value.partial_mirror_value1                 # Partial Mirror1 Size in GiB
#   partial_mirror_value2                 = each.value.partial_mirror_value2                 # Partial Mirror2 Size in GiB
#   partial_mirror_value3                 = each.value.partial_mirror_value3                 # Partial Mirror3 Size in GiB
#   partial_mirror_value4                 = each.value.partial_mirror_value4                 # Partial Mirror4 Size in GiB
#   pc_ie_ras_support                     = each.value.pc_ie_ras_support                     # PCIe RAS Support
#   post_package_repair                   = each.value.post_package_repair                   # Post Package Repair
#   select_memory_ras_configuration       = each.value.select_memory_ras_configuration       # Memory RAS Configuration
#   select_ppr_type                       = each.value.select_ppr_type                       # PPR Type
#   sev                                   = each.value.sev                                   # Secured Encrypted Virtualization
#   smee                                  = each.value.smee                                  # SMEE
#   snoopy_mode_for2lm                    = each.value.snoopy_mode_for2lm                    # Snoopy Mode for 2LM
#   snoopy_mode_for_ad                    = each.value.snoopy_mode_for_ad                    # Snoopy Mode for AD
#   sparing_mode                          = each.value.sparing_mode                          # Sparing Mode
#   tsme                                  = each.value.tsme                                  # Transparent Secure Memory Encryption
#   uma_based_clustering                  = each.value.uma_based_clustering                  # UMA Based Clustering
#   vol_memory_mode                       = each.value.vol_memory_mode                       # Volatile Memory Mode
#   #+++++++++++++++++++++++++++++++
#   # PCI Section
#   #+++++++++++++++++++++++++++++++
#   aspm_support               = each.value.aspm_support               # ASPM Support
#   ioh_resource               = each.value.ioh_resource               # IOH Resource Allocation
#   memory_mapped_io_above4gb  = each.value.memory_mapped_io_above4gb  # Memory Mapped IO Above 4GiB
#   mmcfg_base                 = each.value.mmcfg_base                 # MMCFG BASE
#   onboard10gbit_lom          = each.value.onboard10gbit_lom          # Onboard 10Gbit LOM
#   onboard_gbit_lom           = each.value.onboard_gbit_lom           # Onboard Gbit LOM
#   pc_ie_ssd_hot_plug_support = each.value.pc_ie_ssd_hot_plug_support # NVMe SSD Hot-Plug Support
#   sr_iov                     = each.value.sr_iov                     # SR-IOV Support
#   vga_priority               = each.value.vga_priority               # VGA Priority
#   #+++++++++++++++++++++++++++++++
#   # Power and Performance Section
#   #+++++++++++++++++++++++++++++++
#   cbs_cmn_cpu_cpb                    = each.value.cbs_cmn_cpu_cpb                    # Core Performance Boost
#   cbs_cmn_cpu_global_cstate_ctrl     = each.value.cbs_cmn_cpu_global_cstate_ctrl     # Global C State Control
#   cbs_cmn_cpu_l1stream_hw_prefetcher = each.value.cbs_cmn_cpu_l1stream_hw_prefetcher # L1 Stream HW Prefetcher
#   cbs_cmn_cpu_l2stream_hw_prefetcher = each.value.cbs_cmn_cpu_l2stream_hw_prefetcher # L2 Stream HW Prefetcher
#   cbs_cmn_determinism_slider         = each.value.cbs_cmn_determinism_slider         # Determinism Slider
#   cbs_cmn_efficiency_mode_en         = each.value.cbs_cmn_efficiency_mode_en         # Efficiency Mode Enable
#   cbs_cmn_gnb_smucppc                = each.value.cbs_cmn_gnb_smucppc                # CPPC
#   cbs_cmnc_tdp_ctl                   = each.value.cbs_cmnc_tdp_ctl                   # cTDP Control
#   #+++++++++++++++++++++++++++++++
#   # Processor Section
#   #+++++++++++++++++++++++++++++++
#   adjacent_cache_line_prefetch      = each.value.adjacent_cache_line_prefetch      # Adjacent Cache Line Prefetcher
#   altitude                          = each.value.altitude                          # Altitude
#   auto_cc_state                     = each.value.auto_cc_state                     # Autonomous Core C State
#   autonumous_cstate_enable          = each.value.autonumous_cstate_enable          # CPU Autonomous C State
#   boot_performance_mode             = each.value.boot_performance_mode             # Boot Performance Mode
#   cbs_cmn_apbdis                    = each.value.cbs_cmn_apbdis                    # APBDIS
#   cbs_cmn_cpu_gen_downcore_ctrl     = each.value.cbs_cmn_cpu_gen_downcore_ctrl     # Downcore Control
#   cbs_cmn_cpu_streaming_stores_ctrl = each.value.cbs_cmn_cpu_streaming_stores_ctrl # Streaming Stores Control
#   cbs_cmn_fixed_soc_pstate          = each.value.cbs_cmn_fixed_soc_pstate          # Fixed SOC P-State
#   cbs_cmn_gnb_smu_df_cstates        = each.value.cbs_cmn_gnb_smu_df_cstates        # DF C-States
#   cbs_cpu_ccd_ctrl_ssp              = each.value.cbs_cpu_ccd_ctrl_ssp              # CCD Control
#   cbs_cpu_core_ctrl                 = each.value.cbs_cpu_core_ctrl                 # CPU Downcore Control
#   cbs_cpu_smt_ctrl                  = each.value.cbs_cpu_smt_ctrl                  # CPU SMT Mode
#   cbs_df_cmn_acpi_srat_l3numa       = each.value.cbs_df_cmn_acpi_srat_l3numa       # ACPI SRAT L3 Cache As NUMA Domain
#   channel_inter_leave               = each.value.channel_inter_leave               # Channel Interleaving
#   cisco_xgmi_max_speed              = each.value.cisco_xgmi_max_speed              # Cisco xGMI Max Speed
#   closed_loop_therm_throtl          = each.value.closed_loop_therm_throtl          # Closed Loop Thermal Throttling
#   cmci_enable                       = each.value.cmci_enable                       # Processor CMCI
#   config_tdp                        = each.value.config_tdp                        # Config TDP
#   config_tdp_level                  = each.value.config_tdp_level                  # Configurable TDP Level
#   core_multi_processing             = each.value.core_multi_processing             # Core Multi Processing
#   cpu_energy_performance            = each.value.cpu_energy_performance            # Energy Performance
#   cpu_frequency_floor               = each.value.cpu_frequency_floor               # Frequency Floor Override
#   cpu_performance                   = each.value.cpu_performance                   # CPU Performance
#   cpu_power_management              = each.value.cpu_power_management              # Power Technology
#   demand_scrub                      = each.value.demand_scrub                      # Demand Scrub
#   direct_cache_access               = each.value.direct_cache_access               # Direct Cache Access Support
#   dram_clock_throttling             = each.value.dram_clock_throttling             # DRAM Clock Throttling
#   energy_efficient_turbo            = each.value.energy_efficient_turbo            # Energy Efficient Turbo
#   eng_perf_tuning                   = each.value.eng_perf_tuning                   # Energy Performance Tuning
#   enhanced_intel_speed_step_tech    = each.value.enhanced_intel_speed_step_tech    # Enhanced Intel Speedstep(R) Technology
#   epp_enable                        = each.value.epp_enable                        # Processor EPP Enable
#   epp_profile                       = each.value.epp_profile                       # EPP Profile
#   execute_disable_bit               = each.value.execute_disable_bit               # Execute Disable Bit
#   extended_apic                     = each.value.extended_apic                     # Local X2 Apic
#   hardware_prefetch                 = each.value.hardware_prefetch                 # Hardware Prefetcher
#   hwpm_enable                       = each.value.hwpm_enable                       # CPU Hardware Power Management
#   imc_interleave                    = each.value.imc_interleave                    # IMC Interleaving
#   intel_dynamic_speed_select        = each.value.intel_dynamic_speed_select        # Intel Dynamic Speed Select
#   intel_hyper_threading_tech        = each.value.intel_hyper_threading_tech        # Intel HyperThreading Tech
#   intel_speed_select                = each.value.intel_speed_select                # Intel Speed Select
#   intel_turbo_boost_tech            = each.value.intel_turbo_boost_tech            # Intel Turbo Boost Tech
#   intel_virtualization_technology   = each.value.intel_virtualization_technology   # Intel(R) VT
#   ioh_error_enable                  = each.value.ioh_error_enable                  # IIO Error Enable
#   ip_prefetch                       = each.value.ip_prefetch                       # DCU IP Prefetcher
#   kti_prefetch                      = each.value.kti_prefetch                      # KTI Prefetch
#   llc_prefetch                      = each.value.llc_prefetch                      # LLC Prefetch
#   memory_inter_leave                = each.value.memory_inter_leave                # Intel Memory Interleaving
#   package_cstate_limit              = each.value.package_cstate_limit              # Package C State Limit
#   patrol_scrub                      = each.value.patrol_scrub                      # Patrol Scrub
#   patrol_scrub_duration             = each.value.patrol_scrub_duration             # Patrol Scrub Interval
#   processor_c1e                     = each.value.processor_c1e                     # Processor C1E
#   processor_c3report                = each.value.processor_c3report                # Processor C3 Report
#   processor_c6report                = each.value.processor_c6report                # Processor C6 Report
#   processor_cstate                  = each.value.processor_cstate                  # CPU C State
#   pstate_coord_type                 = each.value.pstate_coord_type                 # P-State Coordination
#   pwr_perf_tuning                   = each.value.pwr_perf_tuning                   # Power Performance Tuning
#   qpi_link_speed                    = each.value.qpi_link_speed                    # UPI Link Frequency Select
#   rank_inter_leave                  = each.value.rank_inter_leave                  # Rank Interleaving
#   single_pctl_enable                = each.value.single_pctl_enable                # Single PCTL
#   smt_mode                          = each.value.smt_mode                          # SMT Mode
#   snc                               = each.value.snc                               # Sub Numa Clustering
#   streamer_prefetch                 = each.value.streamer_prefetch                 # DCU Streamer Prefetch
#   svm_mode                          = each.value.svm_mode                          # SVM Mode
#   ufs_disable                       = each.value.ufs_disable                       # Uncore Frequency Scaling
#   work_load_config                  = each.value.work_load_config                  # Workload Configuration
#   xpt_prefetch                      = each.value.xpt_prefetch                      # XPT Prefetch
#   #+++++++++++++++++++++++++++++++
#   # QPI Section
#   #+++++++++++++++++++++++++++++++
#   qpi_link_frequency = each.value.qpi_link_frequency # QPI Link Frequency Select
#   qpi_snoop_mode     = each.value.qpi_snoop_mode     # QPI Snoop Mode
#   #+++++++++++++++++++++++++++++++
#   # Serial Port Section
#   #+++++++++++++++++++++++++++++++
#   serial_port_aenable = each.value.serial_port_aenable # Serial A Enable
#   #+++++++++++++++++++++++++++++++
#   # Server Management Section
#   #+++++++++++++++++++++++++++++++
#   assert_nmi_on_perr              = each.value.assert_nmi_on_perr              # Assert NMI on PERR
#   assert_nmi_on_serr              = each.value.assert_nmi_on_serr              # Assert NMI on SERR
#   baud_rate                       = each.value.baud_rate                       # Baud Rate
#   cdn_enable                      = each.value.cdn_enable                      # Consistent Device Naming
#   cisco_adaptive_mem_training     = each.value.cisco_adaptive_mem_training     # Adaptive Memory Training
#   cisco_debug_level               = each.value.cisco_debug_level               # BIOS Techlog Level
#   cisco_oprom_launch_optimization = each.value.cisco_oprom_launch_optimization # OptionROM Launch Optimization
#   console_redirection             = each.value.console_redirection             # Console Redirection
#   flow_control                    = each.value.flow_control                    # Flow Control
#   frb2enable                      = each.value.frb2enable                      # FRB-2 Timer
#   legacy_os_redirection           = each.value.legacy_os_redirection           # Legacy OS Redirection
#   os_boot_watchdog_timer          = each.value.os_boot_watchdog_timer          # OS Boot Watchdog Timer
#   os_boot_watchdog_timer_policy   = each.value.os_boot_watchdog_timer_policy   # OS Boot Watchdog Timer Policy
#   os_boot_watchdog_timer_timeout  = each.value.os_boot_watchdog_timer_timeout  # OS Boot Watchdog Timer Timeout
#   out_of_band_mgmt_port           = each.value.out_of_band_mgmt_port           # Out-of-Band Mgmt Port
#   putty_key_pad                   = each.value.putty_key_pad                   # Putty KeyPad
#   redirection_after_post          = each.value.redirection_after_post          # Redirection After BIOS POST
#   terminal_type                   = each.value.terminal_type                   # Terminal Type
#   ucsm_boot_order_rule            = each.value.ucsm_boot_order_rule            # Boot Order Rules
#   #+++++++++++++++++++++++++++++++
#   # Trusted Platform Section
#   #+++++++++++++++++++++++++++++++
#   enable_mktme                    = each.value.enable_mktme                    # Multikey Total Memory Encryption (MK-TME)
#   enable_sgx                      = each.value.enable_sgx                      # Software Guard Extensions
#   enable_tme                      = each.value.enable_tme                      # Total Memory Encryption
#   epoch_update                    = each.value.epoch_update                    # Select Owner EPOCH Input Type
#   sgx_auto_registration_agent     = each.value.sgx_auto_registration_agent     # SGX Auto MP Registration Agent
#   sgx_epoch0                      = each.value.sgx_epoch0                      # SGX Epoch 0
#   sgx_epoch1                      = each.value.sgx_epoch1                      # SGX Epoch 1
#   sgx_factory_reset               = each.value.sgx_factory_reset               # SGX Factory Reset
#   sgx_le_pub_key_hash0            = each.value.sgx_le_pub_key_hash0            # SGX PubKey Hash0
#   sgx_le_pub_key_hash1            = each.value.sgx_le_pub_key_hash1            # SGX PubKey Hash1
#   sgx_le_pub_key_hash2            = each.value.sgx_le_pub_key_hash2            # SGX PubKey Hash2
#   sgx_le_pub_key_hash3            = each.value.sgx_le_pub_key_hash3            # SGX PubKey Hash3
#   sgx_le_wr                       = each.value.sgx_le_wr                       # SGX Write Eanble
#   sgx_package_info_in_band_access = each.value.sgx_package_info_in_band_access # SGX Package Information In-Band Access
#   sgx_qos                         = each.value.sgx_qos                         # SGX QoS
#   tpm_control                     = each.value.tpm_control                     # Trusted Platform Module State
#   tpm_pending_operation           = each.value.tpm_pending_operation           # TPM Pending Operation
#   txt_support                     = each.value.txt_support                     # Intel Trusted Execution Technology Support
#   #+++++++++++++++++++++++++++++++
#   # USB Section
#   #+++++++++++++++++++++++++++++++
#   all_usb_devices          = each.value.all_usb_devices          # All USB Devices
#   legacy_usb_support       = each.value.legacy_usb_support       # Legacy USB Support
#   make_device_non_bootable = each.value.make_device_non_bootable # Make Device Non Bootable
#   pch_usb30mode            = each.value.pch_usb30mode            # xHCI Mode
#   usb_emul6064             = each.value.usb_emul6064             # Port 60/64 Emulation
#   usb_port_front           = each.value.usb_port_front           # USB Port Front
#   usb_port_internal        = each.value.usb_port_internal        # USB Port Internal
#   usb_port_kvm             = each.value.usb_port_kvm             # USB Port KVM
#   usb_port_rear            = each.value.usb_port_rear            # USB Port Rear
#   usb_port_sd_card         = each.value.usb_port_sd_card         # USB Port SD Card
#   usb_port_vmedia          = each.value.usb_port_vmedia          # USB Port VMedia
#   usb_xhci_support         = each.value.usb_xhci_support         # XHCI Legacy Support
# }
