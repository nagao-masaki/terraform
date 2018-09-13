#---------------------------------
# resource_group
#---------------------------------
resource_group_name = "oisixAKSGroup"
location            = "Japan East"

#---------------------------------
# k8s
#---------------------------------
agent_count    = "3"
ssh_public_key = "id_rsa.pub"
dns_prefix     = "oiradaichi"
cluster_name   = "oiradaichi"
