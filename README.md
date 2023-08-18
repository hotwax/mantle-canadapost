# mantle-canadapost
Canada Post shipping gateway integration

### To Simplify:

~ get#ShippingRates service: This API returns a rate as per the destination location and parcel attributes.

~ create#ShippingLabel service: This API will return link for the label, which can be fetched using get#Artifact. It also provides shipment-id which can be stored in ShipmentPackageRouteSeg.

~ get#Artifact service:  This API is used to retrieve an artifact in pfd form, like label and manifest using their link.

~ transmit#Shipment service: This API call provides a list of links to the manifests that are created based on characteristics of the shipments, which is used when one or more groups of shipments is ready.

~ get#Manifest service: This API will return links for the manifest, like artifact link which can be fetched using get#Artifact.

~ void#ShippingLabel service: You will need a shipment-id from a Label Request to void a label.