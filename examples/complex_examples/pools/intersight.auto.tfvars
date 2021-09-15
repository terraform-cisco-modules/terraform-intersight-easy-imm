#__________________________________________________________
#
# Intersight Variables
#__________________________________________________________

# endpoint     = "https://intersight.com"
organizations = ["Asgard", "UCS-DEMO2"]

# secretkey    = "../../../../intersight.secret"
/*
  To export the Secret Key via an Environment Variable the format is as follows (Note: they are not quotation marks, but escape characters):
  - export TF_VAR_secretkey=`cat ../../intersight.secret`
  Either way will work in this case as we are not posting the contents of the file here.
*/
/*
  We highly recommend that for the apikey you use an environment variable for input:
  - export TF_VAR_apikey="abcdefghijklmnopqrstuvwxyz.0123456789"
*/
# apikey = "value"

#__________________________________________________________
#
# Intersight Policy Variables
#__________________________________________________________

tags = [{ key = "Module", value = "terraform-intersight-easy-imm" }, { key = "Owner", value = "tyscott" }]
