# mantle-canadapost
Canada Post shipping gateway integration

### How to setup

- clone moqui-framework
  `git clone https://github.com/moqui/moqui-framework.git`

- go to moqui-framework directory
  `cd moqui-framework`

- clone moqui-runtime
  `git clone https://github.com/moqui/moqui-runtime.git runtime`

- go to runtime/component directory
  `cd runtime/component`

- clone mantle
  `git clone https://github.com/hotwax/mantle.git`

- clone canadapost
  `git clone https://github.com/hotwax/mantle-canadapost`
  
- Use following command to load data
  `./gradlew load`

### To Simplify:

~ get#ShippingRates service: API path: https://ct.soa-gw.canadapost.ca/rs/ship/price This API call is to get shipping rates for your multiple carrier and service options. At minimum, a Rate request requires a delivery location and information on the parcels being delivered. However, different couriers and delivery methods can require additional fields to satisfy their requirements. Set the content type header to "application/vnd.cpc.ship.rate-v4+xml" because body is send in xml form, and the Authorization as basic auth.

~ create#Shipment service: API path: https://ct.soa-gw.canadapost.ca/rs/${customerNumber}/${customerNumber}/shipment Set content type and accept headers to "application/vnd.cpc.shipment-v8+xml", and the Authorization for service. This API call is uses for creating shipment at FedEx end. This call uses the request Body to be in json format. After successful service call, you will receive an HTTP response that included the label details.

~ get#Artifact service: API path: Invoke the link returned from a prior call like create#Shipment where the href contains "/ers/artifact" or "/rs/artifact" and the rel value has the desired type. To retrieve a shipping label, a return label, or the paperwork required for shipment pickup or drop-off (manifest). For this call set Accept as "application/pdf".

Note: For labels, you can call Get Artifact a second time if the original label is destroyed, but the same label with the original barcode is returned each time. 

~ transmit#Shipment service: API path: https://ct.soa-gw.canadapost.ca/rs/${customerNumber}/${customerNumber}/manifest, set Content-Type and Accept as "application/vnd.cpc.manifest-v8+xml". It is used when one or more groups of shipments is ready for pickup by Canada Post or drop-off to a Canada Post location. This can be used for contract shipping.The call provides a list of links to the manifests that are created based on characteristics of the shipments to be transmitted. You must use these links to call the Get Manifest service to ensure a manifest is successfully created.

~ get#Manifest service: API path: Invoke the link returned from a prior call like transmit#Shipment where the href contains "/rs/${customerNumber}/${customerNumber}/manifest". A mandatory call that must be made to create a manifest. You need a successful response from Get Manifest to confirm that a manifest has been successfully created. The response will include a link that allows you to retrieve the manifest label by a call to Get Artifact.Also used to retrieve the PO number so you can use it to cancel a manifest.A link to get the manifest details (rel="details"),a link to get links for all shipments contained within the manifest (rel="manifestShipments"),a link to retrieve this output again (rel="self").

~ void#shipment service: API path: https://ct.soa-gw.canadapost.ca/rs/${customerNumber}/${customerNumber}/shipment/${labelId}, To delete a specific shipment prior to transmit. As an alternative, a shipment can be excluded from a transmit request and therefore remain active for inclusion in a subsequent transmit request. Making this call indicates that the previously printed label is spoiled or will otherwise not be used. Set Accept as "application/vnd.cpc.shipment-v8+xml" for this call.
