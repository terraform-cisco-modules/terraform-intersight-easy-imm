#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

locals {
  # Intersight Organization Variables
  organizations = var.organizations
  org_moids = {
    for v in sort(keys(data.intersight_organization_organization.org_moid)) : v => {
      moid = data.intersight_organization_organization.org_moid[v].results[0].moid
    }
  }

  # Tags for Deployment
  tags = var.tags

  # Terraform Cloud Remote Resources
  ip_pools   = data.terraform_remote_state.pools.outputs.ip_pools
  iqn_pools  = data.terraform_remote_state.pools.outputs.iqn_pools
  mac_pools  = data.terraform_remote_state.pools.outputs.mac_pools
  uuid_pools = data.terraform_remote_state.pools.outputs.uuid_pools
  wwnn_pools = data.terraform_remote_state.pools.outputs.wwnn_pools
  wwpn_pools = data.terraform_remote_state.pools.outputs.wwpn_pools


  #____________________________________________________________
  #
  # BIOS Policy - Custom BIOS Policy
  # GUI Location: Policies > Create Policy: BIOS
  #____________________________________________________________

  bios_policies = {
    for k, v in var.bios_policies : k => {
      acs_control_gpu1state                 = v.acs_control_gpu1state != null ? v.acs_control_gpu1state : "platform-default"
      acs_control_gpu2state                 = v.acs_control_gpu2state != null ? v.acs_control_gpu2state : "platform-default"
      acs_control_gpu3state                 = v.acs_control_gpu3state != null ? v.acs_control_gpu3state : "platform-default"
      acs_control_gpu4state                 = v.acs_control_gpu4state != null ? v.acs_control_gpu4state : "platform-default"
      acs_control_gpu5state                 = v.acs_control_gpu5state != null ? v.acs_control_gpu5state : "platform-default"
      acs_control_gpu6state                 = v.acs_control_gpu6state != null ? v.acs_control_gpu6state : "platform-default"
      acs_control_gpu7state                 = v.acs_control_gpu7state != null ? v.acs_control_gpu7state : "platform-default"
      acs_control_gpu8state                 = v.acs_control_gpu8state != null ? v.acs_control_gpu8state : "platform-default"
      acs_control_slot11state               = v.acs_control_slot11state != null ? v.acs_control_slot11state : "platform-default"
      acs_control_slot12state               = v.acs_control_slot12state != null ? v.acs_control_slot12state : "platform-default"
      acs_control_slot13state               = v.acs_control_slot13state != null ? v.acs_control_slot13state : "platform-default"
      acs_control_slot14state               = v.acs_control_slot14state != null ? v.acs_control_slot14state : "platform-default"
      adjacent_cache_line_prefetch          = v.adjacent_cache_line_prefetch != null ? v.adjacent_cache_line_prefetch : "platform-default"
      advanced_mem_test                     = v.advanced_mem_test != null ? v.advanced_mem_test : "platform-default"
      all_usb_devices                       = v.all_usb_devices != null ? v.all_usb_devices : "platform-default"
      altitude                              = v.altitude != null ? v.altitude : "platform-default"
      aspm_support                          = v.aspm_support != null ? v.aspm_support : "platform-default"
      assert_nmi_on_perr                    = v.assert_nmi_on_perr != null ? v.assert_nmi_on_perr : "platform-default"
      assert_nmi_on_serr                    = v.assert_nmi_on_serr != null ? v.assert_nmi_on_serr : "platform-default"
      auto_cc_state                         = v.auto_cc_state != null ? v.auto_cc_state : "platform-default"
      autonumous_cstate_enable              = v.autonumous_cstate_enable != null ? v.autonumous_cstate_enable : "platform-default"
      baud_rate                             = v.baud_rate != null ? v.baud_rate : "platform-default"
      bios_template                         = v.bios_template != null ? v.bios_template : ""
      bme_dma_mitigation                    = v.bme_dma_mitigation != null ? v.bme_dma_mitigation : "platform-default"
      boot_option_num_retry                 = v.boot_option_num_retry != null ? v.boot_option_num_retry : "platform-default"
      boot_option_re_cool_down              = v.boot_option_re_cool_down != null ? v.boot_option_re_cool_down : "platform-default"
      boot_option_retry                     = v.boot_option_retry != null ? v.boot_option_retry : "platform-default"
      boot_performance_mode                 = v.boot_performance_mode != null ? v.boot_performance_mode : "platform-default"
      burst_and_postponed_refresh           = v.burst_and_postponed_refresh != null ? v.burst_and_postponed_refresh : "platform-default"
      cbs_cmn_apbdis                        = v.cbs_cmn_apbdis != null ? v.cbs_cmn_apbdis : "platform-default"
      cbs_cmn_cpu_cpb                       = v.cbs_cmn_cpu_cpb != null ? v.cbs_cmn_cpu_cpb : "platform-default"
      cbs_cmn_cpu_gen_downcore_ctrl         = v.cbs_cmn_cpu_gen_downcore_ctrl != null ? v.cbs_cmn_cpu_gen_downcore_ctrl : "platform-default"
      cbs_cmn_cpu_global_cstate_ctrl        = v.cbs_cmn_cpu_global_cstate_ctrl != null ? v.cbs_cmn_cpu_global_cstate_ctrl : "platform-default"
      cbs_cmn_cpu_l1stream_hw_prefetcher    = v.cbs_cmn_cpu_l1stream_hw_prefetcher != null ? v.cbs_cmn_cpu_l1stream_hw_prefetcher : "platform-default"
      cbs_cmn_cpu_l2stream_hw_prefetcher    = v.cbs_cmn_cpu_l2stream_hw_prefetcher != null ? v.cbs_cmn_cpu_l2stream_hw_prefetcher : "platform-default"
      cbs_cmn_cpu_smee                      = v.cbs_cmn_cpu_smee != null ? v.cbs_cmn_cpu_smee : "platform-default"
      cbs_cmn_cpu_streaming_stores_ctrl     = v.cbs_cmn_cpu_streaming_stores_ctrl != null ? v.cbs_cmn_cpu_streaming_stores_ctrl : "platform-default"
      cbs_cmn_determinism_slider            = v.cbs_cmn_determinism_slider != null ? v.cbs_cmn_determinism_slider : "platform-default"
      cbs_cmn_efficiency_mode_en            = v.cbs_cmn_efficiency_mode_en != null ? v.cbs_cmn_efficiency_mode_en : "platform-default"
      cbs_cmn_fixed_soc_pstate              = v.cbs_cmn_fixed_soc_pstate != null ? v.cbs_cmn_fixed_soc_pstate : "platform-default"
      cbs_cmn_gnb_nb_iommu                  = v.cbs_cmn_gnb_nb_iommu != null ? v.cbs_cmn_gnb_nb_iommu : "platform-default"
      cbs_cmn_gnb_smu_df_cstates            = v.cbs_cmn_gnb_smu_df_cstates != null ? v.cbs_cmn_gnb_smu_df_cstates : "platform-default"
      cbs_cmn_gnb_smucppc                   = v.cbs_cmn_gnb_smucppc != null ? v.cbs_cmn_gnb_smucppc : "platform-default"
      cbs_cmn_mem_ctrl_bank_group_swap_ddr4 = v.cbs_cmn_mem_ctrl_bank_group_swap_ddr4 != null ? v.cbs_cmn_mem_ctrl_bank_group_swap_ddr4 : "platform-default"
      cbs_cmn_mem_map_bank_interleave_ddr4  = v.cbs_cmn_mem_map_bank_interleave_ddr4 != null ? v.cbs_cmn_mem_map_bank_interleave_ddr4 : "platform-default"
      cbs_cmnc_tdp_ctl                      = v.cbs_cmnc_tdp_ctl != null ? v.cbs_cmnc_tdp_ctl : "platform-default"
      cbs_cpu_ccd_ctrl_ssp                  = v.cbs_cpu_ccd_ctrl_ssp != null ? v.cbs_cpu_ccd_ctrl_ssp : "platform-default"
      cbs_cpu_core_ctrl                     = v.cbs_cpu_core_ctrl != null ? v.cbs_cpu_core_ctrl : "platform-default"
      cbs_cpu_smt_ctrl                      = v.cbs_cpu_smt_ctrl != null ? v.cbs_cpu_smt_ctrl : "platform-default"
      cbs_dbg_cpu_snp_mem_cover             = v.cbs_dbg_cpu_snp_mem_cover != null ? v.cbs_dbg_cpu_snp_mem_cover : "platform-default"
      cbs_dbg_cpu_snp_mem_size_cover        = v.cbs_dbg_cpu_snp_mem_size_cover != null ? v.cbs_dbg_cpu_snp_mem_size_cover : "platform-default"
      cbs_df_cmn_acpi_srat_l3numa           = v.cbs_df_cmn_acpi_srat_l3numa != null ? v.cbs_df_cmn_acpi_srat_l3numa : "platform-default"
      cbs_df_cmn_dram_nps                   = v.cbs_df_cmn_dram_nps != null ? v.cbs_df_cmn_dram_nps : "platform-default"
      cbs_df_cmn_mem_intlv                  = v.cbs_df_cmn_mem_intlv != null ? v.cbs_df_cmn_mem_intlv : "platform-default"
      cbs_df_cmn_mem_intlv_size             = v.cbs_df_cmn_mem_intlv_size != null ? v.cbs_df_cmn_mem_intlv_size : "platform-default"
      cbs_sev_snp_support                   = v.cbs_sev_snp_support != null ? v.cbs_sev_snp_support : "platform-default"
      cdn_enable                            = v.cdn_enable != null ? v.cdn_enable : "platform-default"
      cdn_support                           = v.cdn_support != null ? v.cdn_support : "platform-default"
      channel_inter_leave                   = v.channel_inter_leave != null ? v.channel_inter_leave : "platform-default"
      cisco_adaptive_mem_training           = v.cisco_adaptive_mem_training != null ? v.cisco_adaptive_mem_training : "platform-default"
      cisco_debug_level                     = v.cisco_debug_level != null ? v.cisco_debug_level : "platform-default"
      cisco_oprom_launch_optimization       = v.cisco_oprom_launch_optimization != null ? v.cisco_oprom_launch_optimization : "platform-default"
      cisco_xgmi_max_speed                  = v.cisco_xgmi_max_speed != null ? v.cisco_xgmi_max_speed : "platform-default"
      cke_low_policy                        = v.cke_low_policy != null ? v.cke_low_policy : "platform-default"
      closed_loop_therm_throtl              = v.closed_loop_therm_throtl != null ? v.closed_loop_therm_throtl : "platform-default"
      cmci_enable                           = v.cmci_enable != null ? v.cmci_enable : "platform-default"
      config_tdp                            = v.config_tdp != null ? v.config_tdp : "platform-default"
      config_tdp_level                      = v.config_tdp_level != null ? v.config_tdp_level : "platform-default"
      console_redirection                   = v.console_redirection != null ? v.console_redirection : "platform-default"
      core_multi_processing                 = v.core_multi_processing != null ? v.core_multi_processing : "platform-default"
      cpu_energy_performance                = v.cpu_energy_performance != null ? v.cpu_energy_performance : "platform-default"
      cpu_frequency_floor                   = v.cpu_frequency_floor != null ? v.cpu_frequency_floor : "platform-default"
      cpu_performance                       = v.cpu_performance != null ? v.cpu_performance : "platform-default"
      cpu_power_management                  = v.cpu_power_management != null ? v.cpu_power_management : "platform-default"
      cr_qos                                = v.cr_qos != null ? v.cr_qos : "platform-default"
      crfastgo_config                       = v.crfastgo_config != null ? v.crfastgo_config : "platform-default"
      dcpmm_firmware_downgrade              = v.dcpmm_firmware_downgrade != null ? v.dcpmm_firmware_downgrade : "platform-default"
      demand_scrub                          = v.demand_scrub != null ? v.demand_scrub : "platform-default"
      description                           = v.description != null ? v.description : ""
      direct_cache_access                   = v.direct_cache_access != null ? v.direct_cache_access : "platform-default"
      dram_clock_throttling                 = v.dram_clock_throttling != null ? v.dram_clock_throttling : "platform-default"
      dram_refresh_rate                     = v.dram_refresh_rate != null ? v.dram_refresh_rate : "platform-default"
      dram_sw_thermal_throttling            = v.dram_sw_thermal_throttling != null ? v.dram_sw_thermal_throttling : "platform-default"
      eadr_support                          = v.eadr_support != null ? v.eadr_support : "platform-default"
      edpc_en                               = v.edpc_en != null ? v.edpc_en : "platform-default"
      enable_clock_spread_spec              = v.enable_clock_spread_spec != null ? v.enable_clock_spread_spec : "platform-default"
      enable_mktme                          = v.enable_mktme != null ? v.enable_mktme : "platform-default"
      enable_sgx                            = v.enable_sgx != null ? v.enable_sgx : "platform-default"
      enable_tme                            = v.enable_tme != null ? v.enable_tme : "platform-default"
      energy_efficient_turbo                = v.energy_efficient_turbo != null ? v.energy_efficient_turbo : "platform-default"
      eng_perf_tuning                       = v.eng_perf_tuning != null ? v.eng_perf_tuning : "platform-default"
      enhanced_intel_speed_step_tech        = v.enhanced_intel_speed_step_tech != null ? v.enhanced_intel_speed_step_tech : "platform-default"
      epoch_update                          = v.epoch_update != null ? v.epoch_update : "platform-default"
      epp_enable                            = v.epp_enable != null ? v.epp_enable : "platform-default"
      epp_profile                           = v.epp_profile != null ? v.epp_profile : "platform-default"
      execute_disable_bit                   = v.execute_disable_bit != null ? v.execute_disable_bit : "platform-default"
      extended_apic                         = v.extended_apic != null ? v.extended_apic : "platform-default"
      flow_control                          = v.flow_control != null ? v.flow_control : "platform-default"
      frb2enable                            = v.frb2enable != null ? v.frb2enable : "platform-default"
      hardware_prefetch                     = v.hardware_prefetch != null ? v.hardware_prefetch : "platform-default"
      hwpm_enable                           = v.hwpm_enable != null ? v.hwpm_enable : "platform-default"
      imc_interleave                        = v.imc_interleave != null ? v.imc_interleave : "platform-default"
      intel_dynamic_speed_select            = v.intel_dynamic_speed_select != null ? v.intel_dynamic_speed_select : "platform-default"
      intel_hyper_threading_tech            = v.intel_hyper_threading_tech != null ? v.intel_hyper_threading_tech : "platform-default"
      intel_speed_select                    = v.intel_speed_select != null ? v.intel_speed_select : "platform-default"
      intel_turbo_boost_tech                = v.intel_turbo_boost_tech != null ? v.intel_turbo_boost_tech : "platform-default"
      intel_virtualization_technology       = v.intel_virtualization_technology != null ? v.intel_virtualization_technology : "platform-default"
      intel_vt_for_directed_io              = v.intel_vt_for_directed_io != null ? v.intel_vt_for_directed_io : "platform-default"
      intel_vtd_coherency_support           = v.intel_vtd_coherency_support != null ? v.intel_vtd_coherency_support : "platform-default"
      intel_vtd_interrupt_remapping         = v.intel_vtd_interrupt_remapping != null ? v.intel_vtd_interrupt_remapping : "platform-default"
      intel_vtd_pass_through_dma_support    = v.intel_vtd_pass_through_dma_support != null ? v.intel_vtd_pass_through_dma_support : "platform-default"
      intel_vtdats_support                  = v.intel_vtdats_support != null ? v.intel_vtdats_support : "platform-default"
      ioh_error_enable                      = v.ioh_error_enable != null ? v.ioh_error_enable : "platform-default"
      ioh_resource                          = v.ioh_resource != null ? v.ioh_resource : "platform-default"
      ip_prefetch                           = v.ip_prefetch != null ? v.ip_prefetch : "platform-default"
      ipv4http                              = v.ipv4http != null ? v.ipv4http : "platform-default"
      ipv4pxe                               = v.ipv4pxe != null ? v.ipv4pxe : "platform-default"
      ipv6http                              = v.ipv6http != null ? v.ipv6http : "platform-default"
      ipv6pxe                               = v.ipv6pxe != null ? v.ipv6pxe : "platform-default"
      kti_prefetch                          = v.kti_prefetch != null ? v.kti_prefetch : "platform-default"
      legacy_os_redirection                 = v.legacy_os_redirection != null ? v.legacy_os_redirection : "platform-default"
      legacy_usb_support                    = v.legacy_usb_support != null ? v.legacy_usb_support : "platform-default"
      llc_prefetch                          = v.llc_prefetch != null ? v.llc_prefetch : "platform-default"
      lom_port0state                        = v.lom_port0state != null ? v.lom_port0state : "platform-default"
      lom_port1state                        = v.lom_port1state != null ? v.lom_port1state : "platform-default"
      lom_port2state                        = v.lom_port2state != null ? v.lom_port2state : "platform-default"
      lom_port3state                        = v.lom_port3state != null ? v.lom_port3state : "platform-default"
      lom_ports_all_state                   = v.lom_ports_all_state != null ? v.lom_ports_all_state : "platform-default"
      lv_ddr_mode                           = v.lv_ddr_mode != null ? v.lv_ddr_mode : "platform-default"
      make_device_non_bootable              = v.make_device_non_bootable != null ? v.make_device_non_bootable : "platform-default"
      memory_bandwidth_boost                = v.memory_bandwidth_boost != null ? v.memory_bandwidth_boost : "platform-default"
      memory_inter_leave                    = v.memory_inter_leave != null ? v.memory_inter_leave : "platform-default"
      memory_mapped_io_above4gb             = v.memory_mapped_io_above4gb != null ? v.memory_mapped_io_above4gb : "platform-default"
      memory_refresh_rate                   = v.memory_refresh_rate != null ? v.memory_refresh_rate : "platform-default"
      memory_size_limit                     = v.memory_size_limit != null ? v.memory_size_limit : "platform-default"
      memory_thermal_throttling             = v.memory_thermal_throttling != null ? v.memory_thermal_throttling : "platform-default"
      mirroring_mode                        = v.mirroring_mode != null ? v.mirroring_mode : "platform-default"
      mmcfg_base                            = v.mmcfg_base != null ? v.mmcfg_base : "platform-default"
      network_stack                         = v.network_stack != null ? v.network_stack : "platform-default"
      numa_optimized                        = v.numa_optimized != null ? v.numa_optimized : "platform-default"
      nvmdimm_perform_config                = v.nvmdimm_perform_config != null ? v.nvmdimm_perform_config : "platform-default"
      onboard10gbit_lom                     = v.onboard10gbit_lom != null ? v.onboard10gbit_lom : "platform-default"
      onboard_gbit_lom                      = v.onboard_gbit_lom != null ? v.onboard_gbit_lom : "platform-default"
      onboard_scu_storage_support           = v.onboard_scu_storage_support != null ? v.onboard_scu_storage_support : "platform-default"
      onboard_scu_storage_sw_stack          = v.onboard_scu_storage_sw_stack != null ? v.onboard_scu_storage_sw_stack : "platform-default"
      operation_mode                        = v.operation_mode != null ? v.operation_mode : "platform-default"
      organization                          = v.organization != null ? v.organization : "default"
      os_boot_watchdog_timer                = v.os_boot_watchdog_timer != null ? v.os_boot_watchdog_timer : "platform-default"
      os_boot_watchdog_timer_policy         = v.os_boot_watchdog_timer_policy != null ? v.os_boot_watchdog_timer_policy : "platform-default"
      os_boot_watchdog_timer_timeout        = v.os_boot_watchdog_timer_timeout != null ? v.os_boot_watchdog_timer_timeout : "platform-default"
      out_of_band_mgmt_port                 = v.out_of_band_mgmt_port != null ? v.out_of_band_mgmt_port : "platform-default"
      package_cstate_limit                  = v.package_cstate_limit != null ? v.package_cstate_limit : "platform-default"
      panic_high_watermark                  = v.panic_high_watermark != null ? v.panic_high_watermark : "platform-default"
      partial_cache_line_sparing            = v.partial_cache_line_sparing != null ? v.partial_cache_line_sparing : "platform-default"
      partial_mirror_mode_config            = v.partial_mirror_mode_config != null ? v.partial_mirror_mode_config : "platform-default"
      partial_mirror_percent                = v.partial_mirror_percent != null ? v.partial_mirror_percent : "platform-default"
      partial_mirror_value1                 = v.partial_mirror_value1 != null ? v.partial_mirror_value1 : "platform-default"
      partial_mirror_value2                 = v.partial_mirror_value2 != null ? v.partial_mirror_value2 : "platform-default"
      partial_mirror_value3                 = v.partial_mirror_value3 != null ? v.partial_mirror_value3 : "platform-default"
      partial_mirror_value4                 = v.partial_mirror_value4 != null ? v.partial_mirror_value4 : "platform-default"
      patrol_scrub                          = v.patrol_scrub != null ? v.patrol_scrub : "platform-default"
      patrol_scrub_duration                 = v.patrol_scrub_duration != null ? v.patrol_scrub_duration : "platform-default"
      pc_ie_ras_support                     = v.pc_ie_ras_support != null ? v.pc_ie_ras_support : "platform-default"
      pc_ie_ssd_hot_plug_support            = v.pc_ie_ssd_hot_plug_support != null ? v.pc_ie_ssd_hot_plug_support : "platform-default"
      pch_usb30mode                         = v.pch_usb30mode != null ? v.pch_usb30mode : "platform-default"
      pci_option_ro_ms                      = v.pci_option_ro_ms != null ? v.pci_option_ro_ms : "platform-default"
      pci_rom_clp                           = v.pci_rom_clp != null ? v.pci_rom_clp : "platform-default"
      pcie_ari_support                      = v.pcie_ari_support != null ? v.pcie_ari_support : "platform-default"
      pcie_pll_ssc                          = v.pcie_pll_ssc != null ? v.pcie_pll_ssc : "platform-default"
      pcie_slot_mraid1link_speed            = v.pcie_slot_mraid1link_speed != null ? v.pcie_slot_mraid1link_speed : "platform-default"
      pcie_slot_mraid1option_rom            = v.pcie_slot_mraid1option_rom != null ? v.pcie_slot_mraid1option_rom : "platform-default"
      pcie_slot_mraid2link_speed            = v.pcie_slot_mraid2link_speed != null ? v.pcie_slot_mraid2link_speed : "platform-default"
      pcie_slot_mraid2option_rom            = v.pcie_slot_mraid2option_rom != null ? v.pcie_slot_mraid2option_rom : "platform-default"
      pcie_slot_mstorraid_link_speed        = v.pcie_slot_mstorraid_link_speed != null ? v.pcie_slot_mstorraid_link_speed : "platform-default"
      pcie_slot_mstorraid_option_rom        = v.pcie_slot_mstorraid_option_rom != null ? v.pcie_slot_mstorraid_option_rom : "platform-default"
      pcie_slot_nvme1link_speed             = v.pcie_slot_nvme1link_speed != null ? v.pcie_slot_nvme1link_speed : "platform-default"
      pcie_slot_nvme1option_rom             = v.pcie_slot_nvme1option_rom != null ? v.pcie_slot_nvme1option_rom : "platform-default"
      pcie_slot_nvme2link_speed             = v.pcie_slot_nvme2link_speed != null ? v.pcie_slot_nvme2link_speed : "platform-default"
      pcie_slot_nvme2option_rom             = v.pcie_slot_nvme2option_rom != null ? v.pcie_slot_nvme2option_rom : "platform-default"
      pcie_slot_nvme3link_speed             = v.pcie_slot_nvme3link_speed != null ? v.pcie_slot_nvme3link_speed : "platform-default"
      pcie_slot_nvme3option_rom             = v.pcie_slot_nvme3option_rom != null ? v.pcie_slot_nvme3option_rom : "platform-default"
      pcie_slot_nvme4link_speed             = v.pcie_slot_nvme4link_speed != null ? v.pcie_slot_nvme4link_speed : "platform-default"
      pcie_slot_nvme4option_rom             = v.pcie_slot_nvme4option_rom != null ? v.pcie_slot_nvme4option_rom : "platform-default"
      pcie_slot_nvme5link_speed             = v.pcie_slot_nvme5link_speed != null ? v.pcie_slot_nvme5link_speed : "platform-default"
      pcie_slot_nvme5option_rom             = v.pcie_slot_nvme5option_rom != null ? v.pcie_slot_nvme5option_rom : "platform-default"
      pcie_slot_nvme6link_speed             = v.pcie_slot_nvme6link_speed != null ? v.pcie_slot_nvme6link_speed : "platform-default"
      pcie_slot_nvme6option_rom             = v.pcie_slot_nvme6option_rom != null ? v.pcie_slot_nvme6option_rom : "platform-default"
      pop_support                           = v.pop_support != null ? v.pop_support : "platform-default"
      post_error_pause                      = v.post_error_pause != null ? v.post_error_pause : "platform-default"
      post_package_repair                   = v.post_package_repair != null ? v.post_package_repair : "platform-default"
      processor_c1e                         = v.processor_c1e != null ? v.processor_c1e : "platform-default"
      processor_c3report                    = v.processor_c3report != null ? v.processor_c3report : "platform-default"
      processor_c6report                    = v.processor_c6report != null ? v.processor_c6report : "platform-default"
      processor_cstate                      = v.processor_cstate != null ? v.processor_cstate : "platform-default"
      psata                                 = v.psata != null ? v.psata : "platform-default"
      pstate_coord_type                     = v.pstate_coord_type != null ? v.pstate_coord_type : "platform-default"
      putty_key_pad                         = v.putty_key_pad != null ? v.putty_key_pad : "platform-default"
      pwr_perf_tuning                       = v.pwr_perf_tuning != null ? v.pwr_perf_tuning : "platform-default"
      qpi_link_frequency                    = v.qpi_link_frequency != null ? v.qpi_link_frequency : "platform-default"
      qpi_link_speed                        = v.qpi_link_speed != null ? v.qpi_link_speed : "platform-default"
      qpi_snoop_mode                        = v.qpi_snoop_mode != null ? v.qpi_snoop_mode : "platform-default"
      rank_inter_leave                      = v.rank_inter_leave != null ? v.rank_inter_leave : "platform-default"
      redirection_after_post                = v.redirection_after_post != null ? v.redirection_after_post : "platform-default"
      sata_mode_select                      = v.sata_mode_select != null ? v.sata_mode_select : "platform-default"
      select_memory_ras_configuration       = v.select_memory_ras_configuration != null ? v.select_memory_ras_configuration : "platform-default"
      select_ppr_type                       = v.select_ppr_type != null ? v.select_ppr_type : "platform-default"
      serial_port_aenable                   = v.serial_port_aenable != null ? v.serial_port_aenable : "platform-default"
      sev                                   = v.sev != null ? v.sev : "platform-default"
      sgx_auto_registration_agent           = v.sgx_auto_registration_agent != null ? v.sgx_auto_registration_agent : "platform-default"
      sgx_epoch0                            = v.sgx_epoch0 != null ? v.sgx_epoch0 : "platform-default"
      sgx_epoch1                            = v.sgx_epoch1 != null ? v.sgx_epoch1 : "platform-default"
      sgx_factory_reset                     = v.sgx_factory_reset != null ? v.sgx_factory_reset : "platform-default"
      sgx_le_pub_key_hash0                  = v.sgx_le_pub_key_hash0 != null ? v.sgx_le_pub_key_hash0 : "platform-default"
      sgx_le_pub_key_hash1                  = v.sgx_le_pub_key_hash1 != null ? v.sgx_le_pub_key_hash1 : "platform-default"
      sgx_le_pub_key_hash2                  = v.sgx_le_pub_key_hash2 != null ? v.sgx_le_pub_key_hash2 : "platform-default"
      sgx_le_pub_key_hash3                  = v.sgx_le_pub_key_hash3 != null ? v.sgx_le_pub_key_hash3 : "platform-default"
      sgx_le_wr                             = v.sgx_le_wr != null ? v.sgx_le_wr : "platform-default"
      sgx_package_info_in_band_access       = v.sgx_package_info_in_band_access != null ? v.sgx_package_info_in_band_access : "platform-default"
      sgx_qos                               = v.sgx_qos != null ? v.sgx_qos : "platform-default"
      single_pctl_enable                    = v.single_pctl_enable != null ? v.single_pctl_enable : "platform-default"
      slot10link_speed                      = v.slot10link_speed != null ? v.slot10link_speed : "platform-default"
      slot10state                           = v.slot10state != null ? v.slot10state : "platform-default"
      slot11link_speed                      = v.slot11link_speed != null ? v.slot11link_speed : "platform-default"
      slot11state                           = v.slot11state != null ? v.slot11state : "platform-default"
      slot12link_speed                      = v.slot12link_speed != null ? v.slot12link_speed : "platform-default"
      slot12state                           = v.slot12state != null ? v.slot12state : "platform-default"
      slot13state                           = v.slot13state != null ? v.slot13state : "platform-default"
      slot14state                           = v.slot14state != null ? v.slot14state : "platform-default"
      slot1link_speed                       = v.slot1link_speed != null ? v.slot1link_speed : "platform-default"
      slot1state                            = v.slot1state != null ? v.slot1state : "platform-default"
      slot2link_speed                       = v.slot2link_speed != null ? v.slot2link_speed : "platform-default"
      slot2state                            = v.slot2state != null ? v.slot2state : "platform-default"
      slot3link_speed                       = v.slot3link_speed != null ? v.slot3link_speed : "platform-default"
      slot3state                            = v.slot3state != null ? v.slot3state : "platform-default"
      slot4link_speed                       = v.slot4link_speed != null ? v.slot4link_speed : "platform-default"
      slot4state                            = v.slot4state != null ? v.slot4state : "platform-default"
      slot5link_speed                       = v.slot5link_speed != null ? v.slot5link_speed : "platform-default"
      slot5state                            = v.slot5state != null ? v.slot5state : "platform-default"
      slot6link_speed                       = v.slot6link_speed != null ? v.slot6link_speed : "platform-default"
      slot6state                            = v.slot6state != null ? v.slot6state : "platform-default"
      slot7link_speed                       = v.slot7link_speed != null ? v.slot7link_speed : "platform-default"
      slot7state                            = v.slot7state != null ? v.slot7state : "platform-default"
      slot8link_speed                       = v.slot8link_speed != null ? v.slot8link_speed : "platform-default"
      slot8state                            = v.slot8state != null ? v.slot8state : "platform-default"
      slot9link_speed                       = v.slot9link_speed != null ? v.slot9link_speed : "platform-default"
      slot9state                            = v.slot9state != null ? v.slot9state : "platform-default"
      slot_flom_link_speed                  = v.slot_flom_link_speed != null ? v.slot_flom_link_speed : "platform-default"
      slot_front_nvme10link_speed           = v.slot_front_nvme10link_speed != null ? v.slot_front_nvme10link_speed : "platform-default"
      slot_front_nvme10option_rom           = v.slot_front_nvme10option_rom != null ? v.slot_front_nvme10option_rom : "platform-default"
      slot_front_nvme11link_speed           = v.slot_front_nvme11link_speed != null ? v.slot_front_nvme11link_speed : "platform-default"
      slot_front_nvme11option_rom           = v.slot_front_nvme11option_rom != null ? v.slot_front_nvme11option_rom : "platform-default"
      slot_front_nvme12link_speed           = v.slot_front_nvme12link_speed != null ? v.slot_front_nvme12link_speed : "platform-default"
      slot_front_nvme12option_rom           = v.slot_front_nvme12option_rom != null ? v.slot_front_nvme12option_rom : "platform-default"
      slot_front_nvme13option_rom           = v.slot_front_nvme13option_rom != null ? v.slot_front_nvme13option_rom : "platform-default"
      slot_front_nvme14option_rom           = v.slot_front_nvme14option_rom != null ? v.slot_front_nvme14option_rom : "platform-default"
      slot_front_nvme15option_rom           = v.slot_front_nvme15option_rom != null ? v.slot_front_nvme15option_rom : "platform-default"
      slot_front_nvme16option_rom           = v.slot_front_nvme16option_rom != null ? v.slot_front_nvme16option_rom : "platform-default"
      slot_front_nvme17option_rom           = v.slot_front_nvme17option_rom != null ? v.slot_front_nvme17option_rom : "platform-default"
      slot_front_nvme18option_rom           = v.slot_front_nvme18option_rom != null ? v.slot_front_nvme18option_rom : "platform-default"
      slot_front_nvme19option_rom           = v.slot_front_nvme19option_rom != null ? v.slot_front_nvme19option_rom : "platform-default"
      slot_front_nvme1link_speed            = v.slot_front_nvme1link_speed != null ? v.slot_front_nvme1link_speed : "platform-default"
      slot_front_nvme1option_rom            = v.slot_front_nvme1option_rom != null ? v.slot_front_nvme1option_rom : "platform-default"
      slot_front_nvme20option_rom           = v.slot_front_nvme20option_rom != null ? v.slot_front_nvme20option_rom : "platform-default"
      slot_front_nvme21option_rom           = v.slot_front_nvme21option_rom != null ? v.slot_front_nvme21option_rom : "platform-default"
      slot_front_nvme22option_rom           = v.slot_front_nvme22option_rom != null ? v.slot_front_nvme22option_rom : "platform-default"
      slot_front_nvme23option_rom           = v.slot_front_nvme23option_rom != null ? v.slot_front_nvme23option_rom : "platform-default"
      slot_front_nvme24option_rom           = v.slot_front_nvme24option_rom != null ? v.slot_front_nvme24option_rom : "platform-default"
      slot_front_nvme2link_speed            = v.slot_front_nvme2link_speed != null ? v.slot_front_nvme2link_speed : "platform-default"
      slot_front_nvme2option_rom            = v.slot_front_nvme2option_rom != null ? v.slot_front_nvme2option_rom : "platform-default"
      slot_front_nvme3link_speed            = v.slot_front_nvme3link_speed != null ? v.slot_front_nvme3link_speed : "platform-default"
      slot_front_nvme3option_rom            = v.slot_front_nvme3option_rom != null ? v.slot_front_nvme3option_rom : "platform-default"
      slot_front_nvme4link_speed            = v.slot_front_nvme4link_speed != null ? v.slot_front_nvme4link_speed : "platform-default"
      slot_front_nvme4option_rom            = v.slot_front_nvme4option_rom != null ? v.slot_front_nvme4option_rom : "platform-default"
      slot_front_nvme5link_speed            = v.slot_front_nvme5link_speed != null ? v.slot_front_nvme5link_speed : "platform-default"
      slot_front_nvme5option_rom            = v.slot_front_nvme5option_rom != null ? v.slot_front_nvme5option_rom : "platform-default"
      slot_front_nvme6link_speed            = v.slot_front_nvme6link_speed != null ? v.slot_front_nvme6link_speed : "platform-default"
      slot_front_nvme6option_rom            = v.slot_front_nvme6option_rom != null ? v.slot_front_nvme6option_rom : "platform-default"
      slot_front_nvme7link_speed            = v.slot_front_nvme7link_speed != null ? v.slot_front_nvme7link_speed : "platform-default"
      slot_front_nvme7option_rom            = v.slot_front_nvme7option_rom != null ? v.slot_front_nvme7option_rom : "platform-default"
      slot_front_nvme8link_speed            = v.slot_front_nvme8link_speed != null ? v.slot_front_nvme8link_speed : "platform-default"
      slot_front_nvme8option_rom            = v.slot_front_nvme8option_rom != null ? v.slot_front_nvme8option_rom : "platform-default"
      slot_front_nvme9link_speed            = v.slot_front_nvme9link_speed != null ? v.slot_front_nvme9link_speed : "platform-default"
      slot_front_nvme9option_rom            = v.slot_front_nvme9option_rom != null ? v.slot_front_nvme9option_rom : "platform-default"
      slot_front_slot5link_speed            = v.slot_front_slot5link_speed != null ? v.slot_front_slot5link_speed : "platform-default"
      slot_front_slot6link_speed            = v.slot_front_slot6link_speed != null ? v.slot_front_slot6link_speed : "platform-default"
      slot_gpu1state                        = v.slot_gpu1state != null ? v.slot_gpu1state : "platform-default"
      slot_gpu2state                        = v.slot_gpu2state != null ? v.slot_gpu2state : "platform-default"
      slot_gpu3state                        = v.slot_gpu3state != null ? v.slot_gpu3state : "platform-default"
      slot_gpu4state                        = v.slot_gpu4state != null ? v.slot_gpu4state : "platform-default"
      slot_gpu5state                        = v.slot_gpu5state != null ? v.slot_gpu5state : "platform-default"
      slot_gpu6state                        = v.slot_gpu6state != null ? v.slot_gpu6state : "platform-default"
      slot_gpu7state                        = v.slot_gpu7state != null ? v.slot_gpu7state : "platform-default"
      slot_gpu8state                        = v.slot_gpu8state != null ? v.slot_gpu8state : "platform-default"
      slot_hba_link_speed                   = v.slot_hba_link_speed != null ? v.slot_hba_link_speed : "platform-default"
      slot_hba_state                        = v.slot_hba_state != null ? v.slot_hba_state : "platform-default"
      slot_lom1link                         = v.slot_lom1link != null ? v.slot_lom1link : "platform-default"
      slot_lom2link                         = v.slot_lom2link != null ? v.slot_lom2link : "platform-default"
      slot_mezz_state                       = v.slot_mezz_state != null ? v.slot_mezz_state : "platform-default"
      slot_mlom_link_speed                  = v.slot_mlom_link_speed != null ? v.slot_mlom_link_speed : "platform-default"
      slot_mlom_state                       = v.slot_mlom_state != null ? v.slot_mlom_state : "platform-default"
      slot_mraid_link_speed                 = v.slot_mraid_link_speed != null ? v.slot_mraid_link_speed : "platform-default"
      slot_mraid_state                      = v.slot_mraid_state != null ? v.slot_mraid_state : "platform-default"
      slot_n10state                         = v.slot_n10state != null ? v.slot_n10state : "platform-default"
      slot_n11state                         = v.slot_n11state != null ? v.slot_n11state : "platform-default"
      slot_n12state                         = v.slot_n12state != null ? v.slot_n12state : "platform-default"
      slot_n13state                         = v.slot_n13state != null ? v.slot_n13state : "platform-default"
      slot_n14state                         = v.slot_n14state != null ? v.slot_n14state : "platform-default"
      slot_n15state                         = v.slot_n15state != null ? v.slot_n15state : "platform-default"
      slot_n16state                         = v.slot_n16state != null ? v.slot_n16state : "platform-default"
      slot_n17state                         = v.slot_n17state != null ? v.slot_n17state : "platform-default"
      slot_n18state                         = v.slot_n18state != null ? v.slot_n18state : "platform-default"
      slot_n19state                         = v.slot_n19state != null ? v.slot_n19state : "platform-default"
      slot_n1state                          = v.slot_n1state != null ? v.slot_n1state : "platform-default"
      slot_n20state                         = v.slot_n20state != null ? v.slot_n20state : "platform-default"
      slot_n21state                         = v.slot_n21state != null ? v.slot_n21state : "platform-default"
      slot_n22state                         = v.slot_n22state != null ? v.slot_n22state : "platform-default"
      slot_n23state                         = v.slot_n23state != null ? v.slot_n23state : "platform-default"
      slot_n24state                         = v.slot_n24state != null ? v.slot_n24state : "platform-default"
      slot_n2state                          = v.slot_n2state != null ? v.slot_n2state : "platform-default"
      slot_n3state                          = v.slot_n3state != null ? v.slot_n3state : "platform-default"
      slot_n4state                          = v.slot_n4state != null ? v.slot_n4state : "platform-default"
      slot_n5state                          = v.slot_n5state != null ? v.slot_n5state : "platform-default"
      slot_n6state                          = v.slot_n6state != null ? v.slot_n6state : "platform-default"
      slot_n7state                          = v.slot_n7state != null ? v.slot_n7state : "platform-default"
      slot_n8state                          = v.slot_n8state != null ? v.slot_n8state : "platform-default"
      slot_n9state                          = v.slot_n9state != null ? v.slot_n9state : "platform-default"
      slot_raid_link_speed                  = v.slot_raid_link_speed != null ? v.slot_raid_link_speed : "platform-default"
      slot_raid_state                       = v.slot_raid_state != null ? v.slot_raid_state : "platform-default"
      slot_rear_nvme1link_speed             = v.slot_rear_nvme1link_speed != null ? v.slot_rear_nvme1link_speed : "platform-default"
      slot_rear_nvme1state                  = v.slot_rear_nvme1state != null ? v.slot_rear_nvme1state : "platform-default"
      slot_rear_nvme2link_speed             = v.slot_rear_nvme2link_speed != null ? v.slot_rear_nvme2link_speed : "platform-default"
      slot_rear_nvme2state                  = v.slot_rear_nvme2state != null ? v.slot_rear_nvme2state : "platform-default"
      slot_rear_nvme3link_speed             = v.slot_rear_nvme3link_speed != null ? v.slot_rear_nvme3link_speed : "platform-default"
      slot_rear_nvme3state                  = v.slot_rear_nvme3state != null ? v.slot_rear_nvme3state : "platform-default"
      slot_rear_nvme4link_speed             = v.slot_rear_nvme4link_speed != null ? v.slot_rear_nvme4link_speed : "platform-default"
      slot_rear_nvme4state                  = v.slot_rear_nvme4state != null ? v.slot_rear_nvme4state : "platform-default"
      slot_rear_nvme5state                  = v.slot_rear_nvme5state != null ? v.slot_rear_nvme5state : "platform-default"
      slot_rear_nvme6state                  = v.slot_rear_nvme6state != null ? v.slot_rear_nvme6state : "platform-default"
      slot_rear_nvme7state                  = v.slot_rear_nvme7state != null ? v.slot_rear_nvme7state : "platform-default"
      slot_rear_nvme8state                  = v.slot_rear_nvme8state != null ? v.slot_rear_nvme8state : "platform-default"
      slot_riser1link_speed                 = v.slot_riser1link_speed != null ? v.slot_riser1link_speed : "platform-default"
      slot_riser1slot1link_speed            = v.slot_riser1slot1link_speed != null ? v.slot_riser1slot1link_speed : "platform-default"
      slot_riser1slot2link_speed            = v.slot_riser1slot2link_speed != null ? v.slot_riser1slot2link_speed : "platform-default"
      slot_riser1slot3link_speed            = v.slot_riser1slot3link_speed != null ? v.slot_riser1slot3link_speed : "platform-default"
      slot_riser2link_speed                 = v.slot_riser2link_speed != null ? v.slot_riser2link_speed : "platform-default"
      slot_riser2slot4link_speed            = v.slot_riser2slot4link_speed != null ? v.slot_riser2slot4link_speed : "platform-default"
      slot_riser2slot5link_speed            = v.slot_riser2slot5link_speed != null ? v.slot_riser2slot5link_speed : "platform-default"
      slot_riser2slot6link_speed            = v.slot_riser2slot6link_speed != null ? v.slot_riser2slot6link_speed : "platform-default"
      slot_sas_state                        = v.slot_sas_state != null ? v.slot_sas_state : "platform-default"
      slot_ssd_slot1link_speed              = v.slot_ssd_slot1link_speed != null ? v.slot_ssd_slot1link_speed : "platform-default"
      slot_ssd_slot2link_speed              = v.slot_ssd_slot2link_speed != null ? v.slot_ssd_slot2link_speed : "platform-default"
      smee                                  = v.smee != null ? v.smee : "platform-default"
      smt_mode                              = v.smt_mode != null ? v.smt_mode : "platform-default"
      snc                                   = v.snc != null ? v.snc : "platform-default"
      snoopy_mode_for2lm                    = v.snoopy_mode_for2lm != null ? v.snoopy_mode_for2lm : "platform-default"
      snoopy_mode_for_ad                    = v.snoopy_mode_for_ad != null ? v.snoopy_mode_for_ad : "platform-default"
      sparing_mode                          = v.sparing_mode != null ? v.sparing_mode : "platform-default"
      sr_iov                                = v.sr_iov != null ? v.sr_iov : "platform-default"
      streamer_prefetch                     = v.streamer_prefetch != null ? v.streamer_prefetch : "platform-default"
      svm_mode                              = v.svm_mode != null ? v.svm_mode : "platform-default"
      tags                                  = v.tags != null ? v.tags : []
      terminal_type                         = v.terminal_type != null ? v.terminal_type : "platform-default"
      tpm_control                           = v.tpm_control != null ? v.tpm_control : "platform-default"
      tpm_pending_operation                 = v.tpm_pending_operation != null ? v.tpm_pending_operation : "platform-default"
      tpm_support                           = v.tpm_support != null ? v.tpm_support : "platform-default"
      tsme                                  = v.tsme != null ? v.tsme : "platform-default"
      txt_support                           = v.txt_support != null ? v.txt_support : "platform-default"
      ucsm_boot_order_rule                  = v.ucsm_boot_order_rule != null ? v.ucsm_boot_order_rule : "platform-default"
      ufs_disable                           = v.ufs_disable != null ? v.ufs_disable : "platform-default"
      uma_based_clustering                  = v.uma_based_clustering != null ? v.uma_based_clustering : "platform-default"
      usb_emul6064                          = v.usb_emul6064 != null ? v.usb_emul6064 : "platform-default"
      usb_port_front                        = v.usb_port_front != null ? v.usb_port_front : "platform-default"
      usb_port_internal                     = v.usb_port_internal != null ? v.usb_port_internal : "platform-default"
      usb_port_kvm                          = v.usb_port_kvm != null ? v.usb_port_kvm : "platform-default"
      usb_port_rear                         = v.usb_port_rear != null ? v.usb_port_rear : "platform-default"
      usb_port_sd_card                      = v.usb_port_sd_card != null ? v.usb_port_sd_card : "platform-default"
      usb_port_vmedia                       = v.usb_port_vmedia != null ? v.usb_port_vmedia : "platform-default"
      usb_xhci_support                      = v.usb_xhci_support != null ? v.usb_xhci_support : "platform-default"
      vga_priority                          = v.vga_priority != null ? v.vga_priority : "platform-default"
      vmd_enable                            = v.vmd_enable != null ? v.vmd_enable : "platform-default"
      vol_memory_mode                       = v.vol_memory_mode != null ? v.vol_memory_mode : "platform-default"
      work_load_config                      = v.work_load_config != null ? v.work_load_config : "platform-default"
      xpt_prefetch                          = v.xpt_prefetch != null ? v.xpt_prefetch : "platform-default"
    }
  }


  #__________________________________________________________
  #
  # Device Connector Policy Section - Locals
  #__________________________________________________________

  device_connector_policies = {
    for k, v in var.device_connector_policies : k => {
      description  = v.description != null ? v.description : ""
      lockout      = v.lockout != null ? v.lockout : false
      organization = v.organization != null ? v.organization : "default"
      tags         = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Ethernet Adapter Policy Section - Locals
  #__________________________________________________________

  ethernet_adapter_policies = {
    for k, v in var.ethernet_adapter_policies : k => {
      adapter_template = v.adapter_template != null ? v.adapter_template : ""
      completion_queue_count = length(
        regexall("(Linux-NVMe-RoCE|Linux|Solaris|VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 2 : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 6 : length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 8 : length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 11 : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 12 : length(
        regexall("(MQ-SMBd|MQ)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 576 : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 2000 : v.completion_queue_count != null ? v.completion_queue_count : 5
      completion_ring_size = length(
        regexall("(MQ|usNIC|usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 4 : v.completion_ring_size != null ? v.completion_ring_size : 1
      description = length(
        regexall("(Linux-NVMe-RoCE)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for NVMe using RDMA." : length(
        regexall("(Linux)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for linux." : length(
        regexall("(MQ-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for MultiQueue with RDMA." : length(
        regexall("(MQ)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for VM Multi Queue Connection with no RDMA." : length(
        regexall("(SMBClient)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for SMB Client." : length(
        regexall("(SMBServer)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for SMB server." : length(
        regexall("(Solaris)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Solaris." : length(
        regexall("(SRIOV)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Win8 SRIOV-VMFEX PF." : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for usNIC Oracle RAC Connection." : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for usNIC Connection." : length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for VMWare pass-thru." : length(
        regexall("(VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for VMWare." : length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Azure Stack." : length(
        regexall("(Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Windows high performance and networking with RoCE V2." : length(
        regexall("(Win-HPN)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Windows high performance and networking." : length(
        regexall("(Windows)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? "Recommended adapter settings for Windows." : v.description != null ? v.description : ""
      enable_accelerated_receive_flow_steering = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_accelerated_receive_flow_steering != null ? v.enable_accelerated_receive_flow_steering : false
      enable_advanced_filter = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_advanced_filter != null ? v.enable_advanced_filter : false
      enable_geneve_offload = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_geneve_offload != null ? v.enable_geneve_offload : false
      enable_interrupt_scaling = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_interrupt_scaling != null ? v.enable_interrupt_scaling : false
      enable_nvgre_offload = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_nvgre_offload != null ? v.enable_nvgre_offload : false
      enable_vxlan_offload = length(
        regexall("(Win-AzureStack|Win-HPN|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? false : v.enable_vxlan_offload != null ? v.enable_vxlan_offload : false
      interrupt_coalescing_type = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? "Min" : v.interrupt_coalescing_type != null ? v.interrupt_coalescing_type : false
      interrupt_mode = length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? "MSI" : v.adapter_template != null ? "MSIx" : v.interrupt_mode != null ? v.interrupt_mode : "MSIx"
      interrupt_timer = v.adapter_template != null ? 125 : v.interrupt_timer != null ? v.interrupt_timer : 125
      interrupts = length(
        regexall("(Linux|Solaris|VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 4 : length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 12 : length(
        regexall("(SRIOV)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 32 : length(
        regexall("(MQ-SMBd|Win-HPN|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 512 : length(
        regexall("(Linux-NVMe-RoCE|MQ|Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 256 : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 1024 : v.adapter_template != null ? 8 : v.interrupts != null ? v.interrupts : 8
      organization = v.organization != null ? v.organization : "default"
      receive_queue_count = length(
        regexall("(Linux|Linux-NVMe-RoCE|Solaris|VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 1 : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 6 : length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 8 : length(
        regexall("(MQ-SMBd|MQ)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 512 : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 1000 : v.receive_queue_count != null ? v.receive_queue_count : 4
      receive_ring_size = length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 4096 : v.receive_ring_size != null ? v.receive_ring_size : 512
      receive_side_scaling_enable = length(
        regexall("(Linux|Solaris|VMware)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? true : v.receive_side_scaling_enable != null ? v.receive_side_scaling_enable : true
      roce_cos = v.adapter_template != null ? 5 : v.roce_cos != null ? v.roce_cos : 5
      roce_enable = length(
        regexall("(Linux-NVMe-RoCE|MQ-SMBd|SMBClient|SMBServer|Win-AzureStack|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.roce_enable != null ? v.roce_enable : false
      roce_memory_regions = length(
        regexall("(MQ-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 65536 : length(
        regexall("(Linux-NVMe-RoCE|SMBClient|SMBServer|Win-AzureStack|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 131072 : v.roce_memory_regions != null ? v.roce_memory_regions : 131072
      roce_queue_pairs = length(
        regexall("(MQ-SMBd|SMBClient|Win-AzureStack|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 256 : length(
        regexall("(Linux-NVMe-RoCE)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 1024 : length(
        regexall("(SMBServer)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 2048 : v.roce_queue_pairs != null ? v.roce_queue_pairs : 256
      roce_resource_groups = length(
        regexall("(MQ-SMBd|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 2 : length(
        regexall("(Linux-NVMe-RoCE)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 8 : length(
        regexall("(SMBClient|SMBServer)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 32 : v.roce_resource_groups != null ? v.roce_resource_groups : 4
      roce_version = length(
        regexall("(Linux-NVMe-RoCE|MQ-SMBd|Win-AzureStack|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 2 : v.roce_version != null ? v.roce_version : 1
      rss_enable_ipv4_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.rss_enable_ipv4_hash != null ? v.rss_enable_ipv4_hash : true
      rss_enable_ipv6_extensions_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.rss_enable_ipv6_extensions_hash != null ? v.rss_enable_ipv6_extensions_hash : false
      rss_enable_ipv6_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.rss_enable_ipv6_hash != null ? v.rss_enable_ipv6_hash : true
      rss_enable_tcp_and_ipv4_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.rss_enable_tcp_and_ipv4_hash != null ? v.rss_enable_tcp_and_ipv4_hash : true
      rss_enable_tcp_and_ipv6_extensions_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.rss_enable_tcp_and_ipv6_extensions_hash != null ? v.rss_enable_tcp_and_ipv6_extensions_hash : false
      rss_enable_tcp_and_ipv6_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.rss_enable_tcp_and_ipv6_hash != null ? v.rss_enable_tcp_and_ipv6_hash : true
      rss_enable_udp_and_ipv4_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.rss_enable_udp_and_ipv4_hash != null ? v.rss_enable_udp_and_ipv4_hash : false
      rss_enable_udp_and_ipv6_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.rss_enable_udp_and_ipv6_hash != null ? v.rss_enable_udp_and_ipv6_hash : false
      tags = v.tags != null ? v.tags : []
      tcp_offload_large_recieve = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.tcp_offload_large_recieve != null ? v.tcp_offload_large_recieve : true
      tcp_offload_large_send = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.tcp_offload_large_send != null ? v.tcp_offload_large_send : true
      tcp_offload_rx_checksum = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.tcp_offload_rx_checksum != null ? v.tcp_offload_rx_checksum : true
      tcp_offload_tx_checksum = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.tcp_offload_tx_checksum != null ? v.tcp_offload_tx_checksum : true
      transmit_queue_count = length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 3 : length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 4 : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 6 : length(
        regexall("(MQ-SMBd|MQ)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 64 : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 1000 : v.transmit_queue_count != null ? v.transmit_queue_count : 1
      transmit_ring_size = length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 1024 : v.transmit_ring_size != null ? v.transmit_ring_size : 256
      uplink_failback_timeout = length(
        regexall("(usNIC|usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 0 : v.uplink_failback_timeout != null ? v.uplink_failback_timeout : 5
    }
  }


  #__________________________________________________________
  #
  # Ethernet Network Control Policy Section - Locals
  #__________________________________________________________

  ethernet_network_control_policies = {
    for k, v in var.ethernet_network_control_policies : k => {
      action_on_uplink_fail = v.action_on_uplink_fail != null ? v.action_on_uplink_fail : "linkDown"
      cdp_enable = length(
        regexall("(both_enabled|cdp_enabled)", coalesce(v.base_template, "EMPTY"))
      ) > 0 ? true : v.cdp_enable != null ? v.cdp_enable : false
      description = v.description != null ? v.description : ""
      lldp_enable_receive = length(
        regexall("(both_enabled|lldp_enabled)", coalesce(v.base_template, "EMPTY"))
      ) > 0 ? true : v.lldp_enable_receive != null ? v.lldp_enable_receive : false
      lldp_enable_transmit = length(
        regexall("(both_enabled|lldp_enabled)", coalesce(v.base_template, "EMPTY"))
      ) > 0 ? true : v.lldp_enable_transmit != null ? v.lldp_enable_transmit : false
      mac_register_mode  = v.mac_register_mode != null ? v.mac_register_mode : "nativeVlanOnly"
      mac_security_forge = v.mac_security_forge != null ? v.mac_security_forge : "allow"
      organization       = v.organization != null ? v.organization : "default"
      tags               = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Ethernet Network Group Policy Section - Locals
  #__________________________________________________________

  ethernet_network_group_policies = {
    for k, v in var.ethernet_network_group_policies : k => {
      allowed_vlans = v.allowed_vlans != null ? v.allowed_vlans : "auto"
      description   = v.description != null ? v.description : ""
      native_vlan   = v.native_vlan != null ? v.native_vlan : null
      organization  = v.organization != null ? v.organization : "default"
      tags          = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Ethernet QoS Policy Section - Locals
  #__________________________________________________________

  ethernet_qos_policies = {
    for k, v in var.ethernet_qos_policies : k => {
      burst                 = v.burst != null ? v.burst : 1024
      cos                   = v.cos != null ? v.cos : 0
      description           = v.description != null ? v.description : ""
      enable_trust_host_cos = v.enable_trust_host_cos != null ? v.enable_trust_host_cos : false
      mtu                   = v.mtu != null ? v.mtu : 1500
      organization          = v.organization != null ? v.organization : "default"
      priority              = v.priority != null ? v.priority : "Best Effort"
      rate_limit            = v.rate_limit != null ? v.rate_limit : 0
      tags                  = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Fibre Channel Adapter Policy Section - Locals
  #__________________________________________________________

  fibre_channel_adapter_policies = {
    for k, v in var.fibre_channel_adapter_policies : k => {
      adapter_template = v.adapter_template != null ? v.adapter_template : ""
      description = length(
        regexall("(FCNVMeInitiator)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for FCNVMeInitiator." : length(
        regexall("(FCNVMeTarget)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for FCNVMeTarget." : length(
        regexall("(Initiator)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Initiator." : length(
        regexall("(Linux)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for linux." : length(
        regexall("(Solaris)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Solaris." : length(
        regexall("(VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for VMWare." : length(
        regexall("(WindowsBoot)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for WindowsBoot." : length(
        regexall("(Windows)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? "Recommended adapter settings for Windows." : v.description != null ? v.description : ""
      error_detection_timeout           = v.error_detection_timeout != null ? v.error_detection_timeout : 2000
      enable_fcp_error_recovery         = v.enable_fcp_error_recovery != null ? v.enable_fcp_error_recovery : false
      error_recovery_io_retry_timeout   = v.error_recovery_io_retry_timeout != null ? v.error_recovery_io_retry_timeout : 5
      error_recovery_link_down_timeout  = v.error_recovery_link_down_timeout != null ? v.error_recovery_link_down_timeout : 30000
      error_recovery_port_down_io_retry = v.adapter_template != null ? 30 : v.error_recovery_port_down_io_retry != null ? v.error_recovery_port_down_io_retry : 8
      error_recovery_port_down_timeout = v.adapter_template == "WindowsBoot" ? 5000 : length(
        regexall("(FCNVMeInitiator|Initiator|Solaris|VMware|Windows)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 30000 : v.error_recovery_port_down_timeout != null ? v.error_recovery_port_down_timeout : 10000
      flogi_retries       = v.flogi_retries != null ? v.flogi_retries : 8
      flogi_timeout       = v.flogi_timeout != null ? v.flogi_timeout : 4000
      interrupt_mode      = v.interrupt_mode != null ? v.interrupt_mode : "MSIx"
      io_throttle_count   = v.io_throttle_count != null ? v.io_throttle_count : 256
      lun_queue_depth     = v.lun_queue_depth != null ? v.lun_queue_depth : 20
      max_luns_per_target = v.max_luns_per_target != null ? v.max_luns_per_target : 1024
      organization        = v.organization != null ? v.organization : "default"
      plogi_retries       = v.plogi_retries != null ? v.plogi_retries : 8
      plogi_timeout       = v.adapter_template == "WindowsBoot" ? 4000 : v.plogi_timeout != null ? v.plogi_timeout : 20000
      receive_ring_size = length(
        regexall("(FCNVMeTarget|Target)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 2048 : v.receive_ring_size != null ? v.receive_ring_size : 64
      resource_allocation_timeout = v.resource_allocation_timeout != null ? v.resource_allocation_timeout : 10000
      tags                        = v.tags != null ? v.tags : []
      scsi_io_queue_count = length(
        regexall("(FCNVMeTarget|FCNVMeInitiator)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 16 : v.scsi_io_queue_count != null ? v.scsi_io_queue_count : 1
      scsi_io_ring_size  = v.scsi_io_ring_size != null ? v.scsi_io_ring_size : 512
      transmit_ring_size = v.transmit_ring_size != null ? v.transmit_ring_size : 64
    }
  }


  #__________________________________________________________
  #
  # Fibre Channel Network Policy Section - Locals
  #__________________________________________________________

  fibre_channel_network_policies = {
    for k, v in var.fibre_channel_network_policies : k => {
      default_vlan_id = v.default_vlan_id != null ? v.default_vlan_id : 0
      description     = v.description != null ? v.description : ""
      organization    = v.organization != null ? v.organization : "default"
      tags            = v.tags != null ? v.tags : []
      vsan_id         = v.vsan_id != null ? v.vsan_id : 4
    }
  }


  #__________________________________________________________
  #
  # Fibre Channel QoS Policy Section - Locals
  #__________________________________________________________

  fibre_channel_qos_policies = {
    for k, v in var.fibre_channel_qos_policies : k => {
      burst               = v.burst != null ? v.burst : 1024
      cos                 = v.cos != null ? v.cos : 3
      description         = v.description != null ? v.description : ""
      max_data_field_size = v.max_data_field_size != null ? v.max_data_field_size : 2112
      organization        = v.organization != null ? v.organization : "default"
      rate_limit          = v.rate_limit != null ? v.rate_limit : 0
      tags                = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Flow Control Policy Section - Locals
  #__________________________________________________________

  flow_control_policies = {
    for k, v in var.flow_control_policies : k => {
      description  = v.description != null ? v.description : ""
      priority     = v.priority != null ? v.priority : "auto"
      organization = v.organization != null ? v.organization : "default"
      receive      = v.receive != null ? v.receive : "Disabled"
      send         = v.send != null ? v.send : "Disabled"
      tags         = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # IMC Access Policy Section Locals
  #__________________________________________________________

  imc_access_policies = {
    for k, v in var.imc_access_policies : k => {
      description                = v.description != null ? v.description : ""
      inband_ip_pool             = v.inband_ip_pool != null ? v.inband_ip_pool : ""
      inband_vlan_id             = v.inband_vlan_id != null ? v.inband_vlan_id : 1
      ipv4_address_configuration = v.ipv4_address_configuration != null ? v.ipv4_address_configuration : true
      ipv6_address_configuration = v.ipv6_address_configuration != null ? v.ipv6_address_configuration : false
      organization               = v.organization != null ? v.organization : "default"
      tags                       = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # IPMI over LAN Policy Section Locals
  #__________________________________________________________

  ipmi_over_lan_policies = {
    for k, v in var.ipmi_over_lan_policies : k => {
      description  = v.description != null ? v.description : ""
      enabled      = v.enabled != null ? v.enabled : true
      ipmi_key     = v.ipmi_key != null ? v.ipmi_key : null
      organization = v.organization != null ? v.organization : "default"
      privilege    = v.privilege != null ? v.privilege : "admin"
      tags         = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # LAN Connectivity Policy Section Locals
  #__________________________________________________________

  lan_connectivity_policies = {
    for k, v in var.lan_connectivity_policies : k => {
      description                 = v.description != null ? v.description : ""
      enable_azure_stack_host_qos = v.enable_azure_stack_host_qos != null ? v.enable_azure_stack_host_qos : false
      iqn_allocation_type         = v.iqn_allocation_type != null ? v.iqn_allocation_type : "None"
      iqn_pool                    = v.iqn_pool != null ? v.iqn_pool : ""
      iqn_static_identifier       = v.iqn_static_identifier != null ? v.iqn_static_identifier : ""
      organization                = v.organization != null ? v.organization : "default"
      tags                        = v.tags != null ? v.tags : []
      target_platform             = v.target_platform != null ? v.target_platform : "FIAttached"
      vnic_placement_mode         = v.vnic_placement_mode != null ? v.vnic_placement_mode : "custom"
      vnics                       = v.vnics != null ? v.vnics : {}
    }
  }

  vnics = flatten([
    for key, value in var.lan_connectivity_policies : [
      for v in value.vnics : {
        cdn_source                             = v.cdn_source != null ? v.cdn_source : "vnic"
        cdn_value                              = v.cdn_value != null ? v.cdn_value : ""
        enable_failover                        = v.enable_failover != null ? v.enable_failover : false
        ethernet_adapter_policy                = v.ethernet_adapter_policy != null ? v.ethernet_adapter_policy : ""
        ethernet_network_control_policy        = v.ethernet_network_control_policy != null ? v.ethernet_network_control_policy : ""
        ethernet_network_group_policy          = v.ethernet_network_group_policy != null ? v.ethernet_network_group_policy : ""
        ethernet_network_policy                = v.ethernet_network_policy != null ? v.ethernet_network_policy : ""
        ethernet_qos_policy                    = v.ethernet_qos_policy != null ? v.ethernet_qos_policy : ""
        iscsi_boot_policy                      = v.iscsi_boot_policy != null ? v.iscsi_boot_policy : ""
        lan_connectivity_policy                = key
        mac_address_allocation_type            = v.mac_address_allocation_type != null ? v.mac_address_allocation_type : "POOL"
        mac_address_pool                       = v.mac_address_pool != null ? v.mac_address_pool : ""
        mac_address_static                     = v.mac_address_static != null ? v.mac_address_static : ""
        name                                   = v.name != null ? v.name : "vnic"
        placement_pci_link                     = v.placement_pci_link != null ? v.placement_pci_link : 0
        placement_pci_order                    = v.placement_pci_order != null ? v.placement_pci_order : 0
        placement_slot_id                      = v.placement_slot_id != null ? v.placement_slot_id : "MLOM"
        placement_switch_id                    = v.placement_switch_id != null ? v.placement_switch_id : "None"
        placement_uplink_port                  = v.placement_uplink_port != null ? v.placement_uplink_port : 0
        usnic_adapter_policy                   = v.usnic_adapter_policy != null ? v.usnic_adapter_policy : ""
        usnic_class_of_service                 = v.usnic_class_of_service != null ? v.usnic_class_of_service : 5
        usnic_number_of_usnics                 = v.usnic_number_of_usnics != null ? v.usnic_number_of_usnics : 0
        vmq_enable_virtual_machine_multi_queue = v.vmq_enable_virtual_machine_multi_queue != null ? v.vmq_enable_virtual_machine_multi_queue : false
        vmq_enabled                            = v.vmq_enabled != null ? v.vmq_enabled : false
        vmq_number_of_interrupts               = v.vmq_number_of_interrupts != null ? v.vmq_number_of_interrupts : 16
        vmq_number_of_sub_vnics                = v.vmq_number_of_sub_vnics != null ? v.vmq_number_of_sub_vnics : 64
        vmq_number_of_virtual_machine_queues   = v.vmq_number_of_virtual_machine_queues != null ? v.vmq_number_of_virtual_machine_queues : 4
        vmq_vmmq_adapter_policy                = v.vmq_vmmq_adapter_policy != null ? v.vmq_vmmq_adapter_policy : ""
      }
    ]
  ])


  #__________________________________________________________
  #
  # LDAP Policy Section Locals
  #__________________________________________________________

  ldap_policies = {
    for k, v in var.ldap_policies : k => {
      description                     = v.description != null ? v.description : ""
      ldap_attribute                  = v.ldap_attribute != null ? v.ldap_attribute : "CiscoAvPair"
      ldap_base_dn                    = v.ldap_base_dn != null ? v.ldap_base_dn : "dc=example,dc=com"
      ldap_bind_dn                    = v.ldap_bind_dn != null ? v.ldap_bind_dn : ""
      ldap_bind_method                = v.ldap_bind_method != null ? v.ldap_bind_method : "LoginCredentials"
      ldap_domain                     = v.ldap_domain != null ? v.ldap_domain : "example.com"
      ldap_enable_dns                 = v.ldap_enable_dns != null ? v.ldap_enable_dns : false
      ldap_enable_encryption          = v.ldap_enable_encryption != null ? v.ldap_enable_encryption : false
      ldap_enable_group_authorization = v.ldap_enable_group_authorization != null ? v.ldap_enable_group_authorization : false
      ldap_enabled                    = v.ldap_enabled != null ? v.ldap_enabled : true
      ldap_filter                     = v.ldap_filter != null ? v.ldap_filter : "samAccountName"
      ldap_group_attribute            = v.ldap_group_attribute != null ? v.ldap_group_attribute : "memberOf"
      ldap_nested_group_search_depth  = v.ldap_nested_group_search_depth != null ? v.ldap_nested_group_search_depth : 128
      ldap_nr_source                  = v.ldap_nr_source != null ? v.ldap_nr_source : "Extracted"
      ldap_search_domain              = v.ldap_search_domain != null ? v.ldap_search_domain : ""
      ldap_search_forest              = v.ldap_search_forest != null ? v.ldap_search_forest : ""
      ldap_timeout                    = v.ldap_timeout != null ? v.ldap_timeout : 0
      ldap_user_search_precedence     = v.ldap_user_search_precedence != null ? v.ldap_user_search_precedence : "LocalUserDb"
      organization                    = v.organization != null ? v.organization : "default"
      tags                            = v.tags != null ? v.tags : []
    }
  }

  ldap_servers = {
    for k, v in var.ldap_policies : "ldap_servers" =>
    {
      for key, value in v.ldap_servers : "${k}_${key}" =>
      {
        ldap_port   = value.ldap_port != null ? value.ldap_port : 389
        ldap_server = value.ldap_server != null ? value.ldap_server : 1
        policy      = k
      }
    }
  }

  ldap_groups = {
    for k, v in var.ldap_policies : "ldap_groups" =>
    {
      for key, value in v.ldap_groups : "${k}_${key}" =>
      {
        group_role  = value.group_role != null ? value.group_role : "admin"
        ldap_domain = v.ldap_domain != null ? v.ldap_domain : "example.com"
        ldap_group  = key
        policy      = k
      }
    }
  }

  #__________________________________________________________
  #
  # Link Aggregation Policy Section - Locals
  #__________________________________________________________

  link_aggregation_policies = {
    for k, v in var.link_aggregation_policies : k => {
      description        = v.description != null ? v.description : ""
      lacp_rate          = v.lacp_rate != null ? v.lacp_rate : "normal"
      organization       = v.organization != null ? v.organization : "default"
      suspend_individual = v.suspend_individual != null ? v.suspend_individual : false
      tags               = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Link Control Policy Section - Locals
  #__________________________________________________________

  link_control_policies = {
    for k, v in var.link_control_policies : k => {
      admin_state  = v.admin_state != null ? v.admin_state : "Enabled"
      description  = v.description != null ? v.description : ""
      mode         = v.mode != null ? v.mode : "normal"
      organization = v.organization != null ? v.organization : "default"
      tags         = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Local User Policy Section Locals
  #__________________________________________________________

  local_user_policies = {
    for k, v in var.local_user_policies : k => {
      description              = v.description != null ? v.description : ""
      enforce_strong_password  = v.enforce_strong_password != null ? v.enforce_strong_password : true
      force_send_password      = v.force_send_password != null ? v.force_send_password : false
      grace_period             = v.grace_period != null ? v.grace_period : 0
      notification_period      = v.notification_period != null ? v.notification_period : 15
      organization             = v.organization != null ? v.organization : "default"
      password_expiry          = v.password_expiry != null ? v.password_expiry : false
      password_expiry_duration = v.password_expiry_duration != null ? v.password_expiry_duration : 90
      password_history         = v.password_history != null ? v.password_history : 5
      tags                     = v.tags != null ? v.tags : []
      users                    = v.users != null ? v.users : {}
    }
  }

  local_users = {
    for k, v in var.local_user_policies : "users" =>
    {
      for key, value in v.users : "${k}_${key}" =>
      {
        enabled      = value.enabled != null ? value.enabled : true
        password     = value.password != null ? value.password : 1
        role         = value.role != null ? value.role : "admin"
        policy       = k
        organization = v.organization != null ? v.organization : "default"
        username     = key
      }
    }
  }


  #__________________________________________________________
  #
  # Network Connectivity (DNS) Policy Section - Locals
  #__________________________________________________________

  network_connectivity_policies = {
    for k, v in var.network_connectivity_policies : k => {
      description        = v.description != null ? v.description : ""
      dns_servers_v4     = v.dns_servers_v4 != null ? v.dns_servers_v4 : ["208.67.220.220", "208.67.222.222"]
      dns_servers_v6     = v.dns_servers_v6 != null ? v.dns_servers_v6 : []
      enable_dynamic_dns = v.enable_dynamic_dns != null ? v.enable_dynamic_dns : false
      enable_ipv6        = v.enable_ipv6 != null ? v.enable_ipv6 : false
      organization       = v.organization != null ? v.organization : "default"
      tags               = v.tags != null ? v.tags : []
      update_domain      = v.update_domain != null ? v.update_domain : ""
    }
  }

  # dns_ucs_domain_profiles = [
  #   for s in sort(keys(local.ucs_domain_profiles)) :
  #   {
  #     moid                        = module.ucs_domain_profiles[s].moid,
  #     type                        = "domain",
  #     network_connectivity_policy = local.ucs_domain_profiles[s].network_connectivity_policy
  #   }
  # ]
  #
  # dns_ucs_server_profiles = [
  #   for s in sort(keys(local.ucs_server_profiles)) :
  #   {
  #     moid                        = module.ucs_server_profiles[s].moid,
  #     type                        = "server",
  #     network_connectivity_policy = local.ucs_server_profiles[s].profile.network_connectivity_policy
  #   }
  # ]
  #
  # dns_ucs_profiles = merge(local.dns_ucs_domain_profiles,local.dns_ucs_server_profiles)


  #__________________________________________________________
  #
  # NTP Policy Section - Locals
  #__________________________________________________________

  ntp_policies = {
    for k, v in var.ntp_policies : k => {
      description  = v.description != null ? v.description : ""
      enabled      = v.enabled != null ? v.enabled : true
      ntp_servers  = v.ntp_servers != null ? v.ntp_servers : ["time-a-g.nist.gov", "time-b-g.nist.gov"]
      organization = v.organization != null ? v.organization : "default"
      tags         = v.tags != null ? v.tags : []
      timezone     = v.timezone != null ? v.timezone : "Etc/GMT"
    }
  }


  #__________________________________________________________
  #
  # Persistent Memory Policy Section Locals
  #__________________________________________________________

  persistent_memory_policies = {
    for k, v in var.persistent_memory_policies : k => {
      description                  = v.description != null ? v.description : ""
      goals_memory_percentage      = v.goals_memory_percentage != null ? v.goals_memory_percentage : 0
      goals_persistent_memory_type = v.goals_persistent_memory_type != null ? v.goals_persistent_memory_type : "app-direct"
      logical_namespaces           = v.logical_namespaces != null ? v.logical_namespaces : []
      management_mode              = v.management_mode != null ? v.management_mode : "configured-from-intersight"
      organization                 = v.organization != null ? v.organization : "default"
      retain_namespaces            = v.retain_namespaces != null ? v.retain_namespaces : true
      tags                         = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Power Policy Section - Locals
  #__________________________________________________________

  power_policies = {
    for k, v in var.power_policies : k => {
      allocated_budget    = v.allocated_budget != null ? v.allocated_budget : 0
      description         = v.description != null ? v.description : ""
      organization        = v.organization != null ? v.organization : "default"
      power_profiling     = v.power_profiling != null ? v.power_profiling : "Enabled"
      power_restore_state = v.power_restore_state != null ? v.power_restore_state : "LastState"
      tags                = v.tags != null ? v.tags : []
      redundancy_mode     = v.redundancy_mode != null ? v.redundancy_mode : "Grid"
    }
  }


  #__________________________________________________________
  #
  # SAN Connectivity Policy Section Locals
  #__________________________________________________________

  san_connectivity_policies = {
    for k, v in var.san_connectivity_policies : k => {
      description          = v.description != null ? v.description : ""
      organization         = v.organization != null ? v.organization : "default"
      tags                 = v.tags != null ? v.tags : []
      target_platform      = v.target_platform != null ? v.target_platform : "FIAttached"
      vhba_placement_mode  = v.vhba_placement_mode != null ? v.vhba_placement_mode : "custom"
      vhbas                = v.vhbas != null ? v.vhbas : {}
      wwnn_allocation_type = v.wwnn_allocation_type != null ? v.wwnn_allocation_type : "UP2YOU"
      wwnn_pool            = v.wwnn_pool != null ? v.wwnn_pool : ""
      wwnn_static_address  = v.wwnn_static_address != null ? v.wwnn_static_address : ""
    }
  }

  vhbas = flatten([
    for key, value in var.san_connectivity_policies : [
      for v in value.vhbas : {
        fibre_channel_adapter_policy = v.fibre_channel_adapter_policy != null ? v.fibre_channel_adapter_policy : ""
        fibre_channel_network_policy = v.fibre_channel_network_policy != null ? v.fibre_channel_network_policy : ""
        fibre_channel_qos_policy     = v.fibre_channel_qos_policy != null ? v.fibre_channel_qos_policy : ""
        name                         = v.name != null ? v.name : "vhba"
        persistent_lun_bindings      = v.persistent_lun_bindings != null ? v.persistent_lun_bindings : false
        placement_pci_link           = v.placement_pci_link != null ? v.placement_pci_link : 0
        placement_pci_order          = v.placement_pci_order != null ? v.placement_pci_order : 0
        placement_slot_id            = v.placement_slot_id != null ? v.placement_slot_id : "MLOM"
        placement_switch_id          = v.placement_switch_id != null ? v.placement_switch_id : "None"
        placement_uplink_port        = v.placement_uplink_port != null ? v.placement_uplink_port : 0
        san_connectivity_policy      = key
        vhba_type                    = v.vhba_type != null ? v.vhba_type : "fc-initiator"
        wwpn_allocation_type         = v.wwpn_allocation_type != null ? v.wwpn_allocation_type : "POOL"
        wwpn_pool                    = v.wwpn_pool != null ? v.wwpn_pool : ""
        wwpn_static_address          = v.wwpn_static_address != null ? v.wwpn_static_address : ""
      }
    ]
  ])


  #__________________________________________________________
  #
  # SD Card Policy Section Locals
  #__________________________________________________________

  sd_card_policies = {
    for k, v in var.sd_card_policies : k => {
      description        = v.description != null ? v.description : ""
      enable_diagnostics = v.enable_diagnostics != null ? v.enable_diagnostics : false
      enable_drivers     = v.enable_drivers != null ? v.enable_drivers : false
      enable_huu         = v.enable_huu != null ? v.enable_huu : false
      enable_os          = v.enable_os != null ? v.enable_os : false
      enable_scu         = v.enable_scu != null ? v.enable_scu : false
      organization       = v.organization != null ? v.organization : "default"
      tags               = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Serial over LAN Policy Section Locals
  #__________________________________________________________

  serial_over_lan_policies = {
    for k, v in var.serial_over_lan_policies : k => {
      baud_rate    = v.baud_rate != null ? v.baud_rate : 115200
      com_port     = v.com_port != null ? v.com_port : "com0"
      description  = v.description != null ? v.description : ""
      enabled      = v.enabled != null ? v.enabled : true
      organization = v.organization != null ? v.organization : "default"
      ssh_port     = v.ssh_port != null ? v.ssh_port : 2400
      tags         = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # SMTP Policy Section - Locals
  #__________________________________________________________

  smtp_policies = {
    for k, v in var.smtp_policies : k => {
      description     = v.description != null ? v.description : ""
      enabled         = v.enabled != null ? v.enabled : true
      min_severity    = v.min_severity != null ? v.min_severity : "critical"
      organization    = v.organization != null ? v.organization : "default"
      sender_email    = v.sender_email != null ? v.sender_email : ""
      smtp_port       = v.smtp_port != null ? v.smtp_port : 25
      smtp_recipients = v.smtp_recipients != null ? v.smtp_recipients : []
      smtp_server     = v.smtp_server != null ? v.smtp_server : ""
      tags            = v.tags != null ? v.tags : []
    }
  }

  #__________________________________________________________
  #
  # SNMP Policy Section - Locals
  #__________________________________________________________

  snmp_policies = {
    for k, v in var.snmp_policies : k => {
      access_community_string = v.access_community_string != null ? v.access_community_string : 0
      description             = v.description != null ? v.description : ""
      enable_snmp             = v.enable_snmp != null ? v.enable_snmp : true
      organization            = v.organization != null ? v.organization : "default"
      snmp_community_access   = v.snmp_community_access != null ? v.snmp_community_access : "Disabled"
      snmp_engine_input_id    = v.snmp_engine_input_id != null ? v.snmp_engine_input_id : ""
      snmp_port               = v.snmp_port != null ? v.snmp_port : 161
      snmp_trap_destinations  = v.snmp_trap_destinations != null ? v.snmp_trap_destinations : {}
      snmp_users              = v.snmp_users != null ? v.snmp_users : {}
      system_contact          = v.system_contact != null ? v.system_contact : ""
      system_location         = v.system_location != null ? v.system_location : ""
      tags                    = v.tags != null ? v.tags : []
      trap_community_string   = v.trap_community_string != null ? v.trap_community_string : 0
    }
  }


  #__________________________________________________________
  #
  # SSH Policy Section - Locals
  #__________________________________________________________

  ssh_policies = {
    for k, v in var.ssh_policies : k => {
      description  = v.description != null ? v.description : ""
      enabled      = v.enabled != null ? v.enabled : true
      organization = v.organization != null ? v.organization : "default"
      ssh_port     = v.ssh_port != null ? v.ssh_port : 22
      tags         = v.tags != null ? v.tags : []
      timeout      = v.timeout != null ? v.timeout : 1800
    }
  }


  #__________________________________________________________
  #
  # Switch Control Policy Section - Locals
  #__________________________________________________________

  switch_control_policies = {
    for k, v in var.switch_control_policies : k => {
      description                  = v.description != null ? v.description : ""
      mac_address_table_aging      = v.mac_address_table_aging != null ? v.mac_address_table_aging : "Default"
      mac_aging_time               = v.mac_aging_time != null ? v.mac_aging_time : 14500
      organization                 = v.organization != null ? v.organization : "default"
      tags                         = v.tags != null ? v.tags : []
      udld_message_interval        = v.udld_message_interval != null ? v.udld_message_interval : 15
      udld_recovery_action         = v.udld_recovery_action != null ? v.udld_recovery_action : "none"
      vlan_port_count_optimization = v.vlan_port_count_optimization != null ? v.vlan_port_count_optimization : false
    }
  }


  #__________________________________________________________
  #
  # Syslog Policy Section Locals
  #__________________________________________________________

  syslog_policies = {
    for k, v in var.syslog_policies : k => {
      description        = v.description != null ? v.description : ""
      local_min_severity = v.local_min_severity != null ? v.local_min_severity : "warning"
      organization       = v.organization != null ? v.organization : "default"
      remote_clients     = v.remote_clients != null ? v.remote_clients : []
      tags               = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Thermal Policy Section - Locals
  #__________________________________________________________

  thermal_policies = {
    for k, v in var.thermal_policies : k => {
      description      = v.description != null ? v.description : ""
      fan_control_mode = v.fan_control_mode != null ? v.fan_control_mode : "Balanced"
      organization     = v.organization != null ? v.organization : "default"
      tags             = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # UCS Chassis Profiles Section - Locals
  #__________________________________________________________
  ucs_chassis_profiles = {
    for k, v in var.ucs_chassis_profiles : k => {
      action              = v.action != null ? v.action : "No-op"
      assign_chassis      = v.assign_chassis != null ? v.assign_chassis : false
      description         = v.description != null ? v.description : ""
      organization        = v.organization != null ? v.organization : "default"
      imc_access_policy   = v.imc_access_policy != null ? v.imc_access_policy : ""
      power_policy        = v.power_policy != null ? v.power_policy : ""
      serial_number       = v.serial_number != null ? v.serial_number : ""
      snmp_policy         = v.snmp_policy != null ? v.snmp_policy : ""
      thermal_policy      = v.thermal_policy != null ? v.thermal_policy : ""
      tags                = v.tags != null ? v.tags : []
      target_platform     = v.target_platform != null ? v.target_platform : "FIAttached"
      wait_for_completion = v.wait_for_completion != null ? v.wait_for_completion : false
    }
  }


  #__________________________________________________________
  #
  # UCS Domain Profiles Section - Locals
  #__________________________________________________________
  ucs_domain_profiles = {
    for k, v in var.ucs_domain_profiles : k => {
      action          = v.action != null ? v.action : "No-op"
      assign_switches = v.assign_switches != null ? v.assign_switches : false
      device_model = length(
        regexall("(UCS-FI-6454|UCS-FI-64108)", coalesce(v.device_model, "EMPTY"))
      ) > 0 ? v.device_model : "UCS-FI-6454"
      description                 = v.description != null ? v.description : ""
      network_connectivity_policy = v.network_connectivity_policy != null ? v.network_connectivity_policy : ""
      ntp_policy                  = v.ntp_policy != null ? v.ntp_policy : ""
      organization                = v.organization != null ? v.organization : "default"
      serial_number_fabric_a      = v.serial_number_fabric_a != null ? v.serial_number_fabric_a : ""
      serial_number_fabric_b      = v.serial_number_fabric_b != null ? v.serial_number_fabric_b : ""
      snmp_policy                 = v.snmp_policy != null ? v.snmp_policy : ""
      switch_control_policy       = v.switch_control_policy != null ? v.switch_control_policy : ""
      syslog_policy               = v.syslog_policy != null ? v.syslog_policy : ""
      system_qos_policy           = v.system_qos_policy != null ? v.system_qos_policy : ""
      tags                        = v.tags != null ? v.tags : []
      vlan_policy_fabric_a        = v.vlan_policy_fabric_a != null ? v.vlan_policy_fabric_a : ""
      vlan_policy_fabric_b        = v.vlan_policy_fabric_b != null ? v.vlan_policy_fabric_b : ""
      vsan_policy_fabric_a        = v.vsan_policy_fabric_a != null ? v.vsan_policy_fabric_a : ""
      vsan_policy_fabric_b        = v.vsan_policy_fabric_b != null ? v.vsan_policy_fabric_b : ""
    }
  }

  ucs_domain_switch_a = {
    for k, v in local.ucs_domain_profiles : "${k}_A_SIDE" => {
      action                      = v.action
      assign_switches             = v.assign_switches
      device_model                = v.device_model
      description                 = v.description
      domain_profile              = k
      fabric                      = "A"
      network_connectivity_policy = v.network_connectivity_policy
      ntp_policy                  = v.ntp_policy
      organization                = v.organization
      serial_number               = v.serial_number_fabric_a
      snmp_policy                 = v.snmp_policy
      switch_control_policy       = v.switch_control_policy
      syslog_policy               = v.syslog_policy
      system_qos_policy           = v.system_qos_policy
      tags                        = v.tags
      vlan_policy                 = v.vlan_policy_fabric_a
      vsan_policy                 = v.vsan_policy_fabric_a
    }
  }

  ucs_domain_switch_b = {
    for k, v in local.ucs_domain_profiles : "${k}_B_SIDE" => {
      action                      = v.action
      assign_switches             = v.assign_switches
      device_model                = v.device_model
      description                 = v.description
      domain_profile              = k
      fabric                      = "B"
      network_connectivity_policy = v.network_connectivity_policy
      ntp_policy                  = v.ntp_policy
      organization                = v.organization
      serial_number               = v.serial_number_fabric_b
      snmp_policy                 = v.snmp_policy
      switch_control_policy       = v.switch_control_policy
      syslog_policy               = v.syslog_policy
      system_qos_policy           = v.system_qos_policy
      tags                        = v.tags
      vlan_policy                 = v.vlan_policy_fabric_b
      vsan_policy                 = v.vsan_policy_fabric_b
    }
  }

  merged_ucs_switches = merge(local.ucs_domain_switch_a, local.ucs_domain_switch_b)


  #__________________________________________________________
  #
  # UCS Server Profiles Section - Locals
  #__________________________________________________________
  ucs_server_profiles = {
    for k, v in var.ucs_server_profiles : k => {
      action                        = v.action != null ? v.action : "No-op"
      adapter_policy                = v.adapter_policy != null ? v.adapter_policy : ""
      assign_server                 = v.assign_server != null ? v.assign_server : false
      bios_policy                   = v.bios_policy != null ? v.bios_policy : ""
      boot_order_policy             = v.boot_order_policy != null ? v.boot_order_policy : ""
      certificate_management_policy = v.certificate_management_policy != null ? v.certificate_management_policy : ""
      description                   = v.description != null ? v.description : ""
      device_connector_policy       = v.device_connector_policy != null ? v.device_connector_policy : ""
      imc_access_policy             = v.imc_access_policy != null ? v.imc_access_policy : ""
      ipmi_over_lan_policy          = v.ipmi_over_lan_policy != null ? v.ipmi_over_lan_policy : ""
      lan_connectivity_policy       = v.lan_connectivity_policy != null ? v.lan_connectivity_policy : ""
      ldap_policy                   = v.ldap_policy != null ? v.ldap_policy : ""
      local_user_policy             = v.local_user_policy != null ? v.local_user_policy : ""
      network_connectivity_policy   = v.network_connectivity_policy != null ? v.network_connectivity_policy : ""
      ntp_policy                    = v.ntp_policy != null ? v.ntp_policy : ""
      organization                  = v.organization != null ? v.organization : "default"
      persistent_memory_policy      = v.persistent_memory_policy != null ? v.persistent_memory_policy : ""
      power_policy                  = v.power_policy != null ? v.power_policy : ""
      san_connectivity_policy       = v.san_connectivity_policy != null ? v.san_connectivity_policy : ""
      sd_card_policy                = v.sd_card_policy != null ? v.sd_card_policy : ""
      serial_number                 = v.serial_number != null ? v.serial_number : ""
      serial_over_lan_policy        = v.serial_over_lan_policy != null ? v.serial_over_lan_policy : ""
      smtp_policy                   = v.smtp_policy != null ? v.smtp_policy : ""
      snmp_policy                   = v.snmp_policy != null ? v.snmp_policy : ""
      ssh_policy                    = v.ssh_policy != null ? v.ssh_policy : ""
      storage_policy                = v.storage_policy != null ? v.storage_policy : ""
      syslog_policy                 = v.syslog_policy != null ? v.syslog_policy : ""
      tags                          = v.tags != null ? v.tags : []
      target_platform               = v.target_platform != null ? v.target_platform : "FIAttached"
      ucs_server_profile_template   = v.ucs_server_profile_template != null ? v.ucs_server_profile_template : ""
      virtual_kvm_policy            = v.virtual_kvm_policy != null ? v.virtual_kvm_policy : ""
      virtual_media_policy          = v.virtual_media_policy != null ? v.virtual_media_policy : ""
      wait_for_completion           = v.wait_for_completion != null ? v.wait_for_completion : false
    }
  }


  #__________________________________________________________
  #
  # UCS Server Profile Templates Section - Locals
  #__________________________________________________________
  ucs_server_profile_templates = {
    for k, v in var.ucs_server_profile_templates : k => {
      adapter_policy                = v.adapter_policy != null ? v.adapter_policy : ""
      bios_policy                   = v.bios_policy != null ? v.bios_policy : ""
      boot_order_policy             = v.boot_order_policy != null ? v.boot_order_policy : ""
      certificate_management_policy = v.certificate_management_policy != null ? v.certificate_management_policy : ""
      description                   = v.description != null ? v.description : ""
      device_connector_policy       = v.device_connector_policy != null ? v.device_connector_policy : ""
      imc_access_policy             = v.imc_access_policy != null ? v.imc_access_policy : ""
      ipmi_over_lan_policy          = v.ipmi_over_lan_policy != null ? v.ipmi_over_lan_policy : ""
      lan_connectivity_policy       = v.lan_connectivity_policy != null ? v.lan_connectivity_policy : ""
      ldap_policy                   = v.ldap_policy != null ? v.ldap_policy : ""
      local_user_policy             = v.local_user_policy != null ? v.local_user_policy : ""
      network_connectivity_policy   = v.network_connectivity_policy != null ? v.network_connectivity_policy : ""
      ntp_policy                    = v.ntp_policy != null ? v.ntp_policy : ""
      operating_system              = v.operating_system != null ? v.operating_system : "VMware"
      organization                  = v.organization != null ? v.organization : "default"
      persistent_memory_policy      = v.persistent_memory_policy != null ? v.persistent_memory_policy : ""
      power_policy                  = v.power_policy != null ? v.power_policy : ""
      san_connectivity_policy       = v.san_connectivity_policy != null ? v.san_connectivity_policy : ""
      sd_card_policy                = v.sd_card_policy != null ? v.sd_card_policy : ""
      serial_over_lan_policy        = v.serial_over_lan_policy != null ? v.serial_over_lan_policy : ""
      smtp_policy                   = v.smtp_policy != null ? v.smtp_policy : ""
      snmp_policy                   = v.snmp_policy != null ? v.snmp_policy : ""
      ssh_policy                    = v.ssh_policy != null ? v.ssh_policy : ""
      storage_policy                = v.storage_policy != null ? v.storage_policy : ""
      syslog_policy                 = v.syslog_policy != null ? v.syslog_policy : ""
      tags                          = v.tags != null ? v.tags : []
      target_platform               = v.target_platform != null ? v.target_platform : "FIAttached"
      virtual_kvm_policy            = v.virtual_kvm_policy != null ? v.virtual_kvm_policy : ""
      virtual_media_policy          = v.virtual_media_policy != null ? v.virtual_media_policy : ""
    }
  }

  #__________________________________________________________
  #
  # Preparing Data for Profile Association - Locals
  #__________________________________________________________
  ucs_chassis_moids = {
    for k, v in local.ucs_chassis_profiles : k => {
      imc_access_policy           = v.imc_access_policy
      moid                        = module.ucs_chassis_profiles[k].moid
      network_connectivity_policy = ""
      ntp_policy                  = ""
      object_type                 = "chassis.Profile"
      organization                = v.organization
      snmp_policy                 = v.snmp_policy
      power_policy                = v.power_policy
      syslog_policy               = ""
      switch_control_policy       = ""
      system_qos_policy           = ""
      vlan_policy                 = ""
      vsan_policy                 = ""
    }
  }

  ucs_domain_switch_a_moids = {
    for k, v in local.ucs_domain_switch_a : k => {
      imc_access_policy           = ""
      moid                        = module.ucs_domain_switches[k].moid
      network_connectivity_policy = v.network_connectivity_policy
      ntp_policy                  = v.ntp_policy
      object_type                 = "fabric.SwitchProfile"
      organization                = v.organization
      power_policy                = ""
      snmp_policy                 = v.snmp_policy
      switch_control_policy       = v.switch_control_policy
      syslog_policy               = v.syslog_policy
      system_qos_policy           = v.system_qos_policy
      vlan_policy                 = v.vlan_policy
      vsan_policy                 = v.vsan_policy
    }
  }

  ucs_domain_switch_b_moids = {
    for k, v in local.ucs_domain_switch_b : k => {
      imc_access_policy           = ""
      moid                        = module.ucs_domain_switches[k].moid
      network_connectivity_policy = v.network_connectivity_policy
      ntp_policy                  = v.ntp_policy
      object_type                 = "fabric.SwitchProfile"
      organization                = v.organization
      power_policy                = ""
      snmp_policy                 = v.snmp_policy
      switch_control_policy       = v.switch_control_policy
      syslog_policy               = v.syslog_policy
      system_qos_policy           = v.system_qos_policy
      vlan_policy                 = v.vlan_policy
      vsan_policy                 = v.vsan_policy
    }
  }

  ucs_server_moids = {
    for k, v in local.ucs_server_profiles : k => {
      adapter_policy                = v.adapter_policy
      bios_policy                   = v.bios_policy
      boot_order_policy             = v.boot_order_policy
      certificate_management_policy = v.certificate_management_policy
      device_connector_policy       = v.device_connector_policy
      imc_access_policy             = v.imc_access_policy
      ipmi_over_lan_policy          = v.ipmi_over_lan_policy
      lan_connectivity_policy       = v.lan_connectivity_policy
      ldap_policy                   = v.ldap_policy
      local_user_policy             = v.local_user_policy
      moid                          = module.ucs_server_profiles[k].moid
      network_connectivity_policy   = v.network_connectivity_policy
      ntp_policy                    = v.ntp_policy
      object_type                   = "server.Profile"
      organization                  = v.organization
      persistent_memory_policy      = v.persistent_memory_policy
      power_policy                  = v.power_policy
      san_connectivity_policy       = v.san_connectivity_policy
      sd_card_policy                = v.sd_card_policy
      serial_over_lan_policy        = v.serial_over_lan_policy
      snmp_policy                   = v.snmp_policy
      smtp_policy                   = v.smtp_policy
      ssh_policy                    = v.ssh_policy
      storage_policy                = v.storage_policy
      switch_control_policy         = ""
      syslog_policy                 = v.syslog_policy
      system_qos_policy             = ""
      target_platform               = v.target_platform
      virtual_kvm_policy            = v.virtual_kvm_policy
      virtual_media_policy          = v.virtual_media_policy
      vlan_policy                   = ""
      vsan_policy                   = ""
    } if v.ucs_server_profile_template == ""
  }

  ucs_template_moids = {
    for k, v in local.ucs_server_profile_templates : k => {
      adapter_policy                = v.adapter_policy
      bios_policy                   = v.bios_policy
      boot_order_policy             = v.boot_order_policy
      certificate_management_policy = v.certificate_management_policy
      device_connector_policy       = v.device_connector_policy
      imc_access_policy             = v.imc_access_policy
      ipmi_over_lan_policy          = v.ipmi_over_lan_policy
      lan_connectivity_policy       = v.lan_connectivity_policy
      ldap_policy                   = v.ldap_policy
      local_user_policy             = v.local_user_policy
      moid                          = module.ucs_server_profile_templates[k].moid
      network_connectivity_policy   = v.network_connectivity_policy
      ntp_policy                    = v.ntp_policy
      object_type                   = "server.ProfileTemplate"
      organization                  = v.organization
      persistent_memory_policy      = v.persistent_memory_policy
      power_policy                  = v.power_policy
      san_connectivity_policy       = v.san_connectivity_policy
      sd_card_policy                = v.sd_card_policy
      serial_over_lan_policy        = v.serial_over_lan_policy
      snmp_policy                   = v.snmp_policy
      smtp_policy                   = v.smtp_policy
      ssh_policy                    = v.ssh_policy
      storage_policy                = v.storage_policy
      switch_control_policy         = ""
      syslog_policy                 = v.syslog_policy
      system_qos_policy             = ""
      target_platform               = v.target_platform
      virtual_kvm_policy            = v.virtual_kvm_policy
      virtual_media_policy          = v.virtual_media_policy
      vlan_policy                   = ""
      vsan_policy                   = ""
    }
  }

  merged_server_moids = merge(local.ucs_server_moids, local.ucs_template_moids)

  merge_all_moids = merge(
    local.ucs_chassis_moids,
    local.ucs_domain_switch_a_moids,
    local.ucs_domain_switch_b_moids,
    local.ucs_server_moids,
    local.ucs_template_moids
  )


  #__________________________________________________________
  #
  # Virtual KVM Policy Section Locals
  #__________________________________________________________

  virtual_kvm_policies = {
    for k, v in var.virtual_kvm_policies : k => {
      description               = v.description != null ? v.description : ""
      enable_local_server_video = v.enable_local_server_video != null ? v.enable_local_server_video : true
      enable_video_encryption   = v.enable_video_encryption != null ? v.enable_video_encryption : false
      enable_virtual_kvm        = v.enable_virtual_kvm != null ? v.enable_virtual_kvm : true
      maximum_sessions          = v.maximum_sessions != null ? v.maximum_sessions : 4
      organization              = v.organization != null ? v.organization : "default"
      remote_port               = v.remote_port != null ? v.remote_port : 2068
      tags                      = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Virtual Media Policy Section Locals
  #__________________________________________________________

  virtual_media_policies = {
    for k, v in var.virtual_media_policies : k => {
      description                     = v.description != null ? v.description : ""
      enabled                         = v.enabled != null ? v.enabled : true
      enable_low_power_usb            = v.enable_low_power_usb != null ? v.enable_low_power_usb : false
      enable_virtual_media_encryption = v.enable_virtual_media_encryption != null ? v.enable_virtual_media_encryption : true
      organization                    = v.organization != null ? v.organization : "default"
      tags                            = v.tags != null ? v.tags : []
      vmedia_mappings                 = v.vmedia_mappings != null ? v.vmedia_mappings : []
    }
  }


  #__________________________________________________________
  #
  # VSAN Policy Section Locals
  #__________________________________________________________

  vsan_policies = {
    for k, v in var.vsan_policies : k => {
      description     = v.description != null ? v.description : ""
      organization    = v.organization != null ? v.organization : "default"
      tags            = v.tags != null ? v.tags : []
      uplink_trunking = v.uplink_trunking != null ? v.uplink_trunking : false
      vsans           = v.vsans != null ? v.vsans : {}
    }
  }

  vsans = flatten([
    for key, value in var.vsan_policies : [
      for v in value.vsans : {
        default_zoning = v.default_zoning != null ? v.default_zoning : "Disabled"
        fcoe_vlan_id   = v.fcoe_vlan_id != null ? v.fcoe_vlan_id : 4
        name           = v.name != null ? v.name : "vsan-${v.vsan_id}"
        vsan_id        = v.vsan_id != null ? v.vsan_id : 4
        vsan_policy    = key
      }
    ]
  ])
}
