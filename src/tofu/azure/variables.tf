variable "location" {
  description = "The region of used to deploy your resources"
  type        = string
}

######## Azure variables ########

variable "azure_resource_group" {
  description = "The name of the Azure Resource Group that the virtual network belongs to"
  type        = string
}

variable "azure_subscription_id" {
  description = "The Azure subscription ID to enable for the Private Link Access where your VNet exists"
  type        = string
}

variable "azure_client_id" {
  description = "The ID of the Client on Azure"
  type        = string
}

variable "azure_client_secret" {
  description = "The Secret of the Client on Azure"
  type        = string
}

variable "azure_tenant_id" {
  description = "The Azure tenant ID in which Subscription exists"
  type        = string
}

