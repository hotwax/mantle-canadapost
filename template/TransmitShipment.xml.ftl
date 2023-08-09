<#escape x as x?xml>
<@compress single_line=true>
        <?xml version="1.0" encoding="utf-8"?>
        <transmit-set xmlns="http://www.canadapost.ca/ws/manifest-v8">
            <group-ids>
                    <group-id>${facility.facilityName!}</group-id>
            </group-ids>
            <requested-shipping-point>${facilityPostalAddress.postalCode}</requested-shipping-point>
            <cpc-pickup-indicator>true</cpc-pickup-indicator>
            <detailed-manifests>true</detailed-manifests>
            <method-of-payment>Account</method-of-payment>
            <manifest-address>
                <manifest-company>${facility.facilityName}</manifest-company>
                <manifest-name>${facilityPostalAddress.toName}</manifest-name>
                <phone-number>${manifestPhoneNumber!}</phone-number>
                <address-details>
                    <address-line-1>${facilityPostalAddress.address1}</address-line-1>
                    <city>${facilityPostalAddress.city}</city>
                    <prov-state>${facilityStateGeo.geoCodeAlpha2}</prov-state>
                    <country-code>${facilityCountryGeo.geoCodeAlpha2}</country-code>
                    <postal-zip-code>${facilityPostalAddress.postalCode}</postal-zip-code>
                </address-details>
            </manifest-address>
            <#if excludeShipments?has_content>
                <excluded-shipments>
                    <#list excludeShipments as excludeShipment>
                        <shipment-id>${excludeShipment!}</shipment-id>
                    </#list>
                </excluded-shipments>
            </#if>
        </transmit-set>
</@compress>
</#escape>