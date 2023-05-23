<#escape x as x?xml>
<@compress single_line=true>
        <?xml version="1.0" encoding="utf-8"?>
        <transmit-set xmlns="http://www.canadapost.ca/ws/manifest-v8">
            <group-ids>
                <#list groupIds as groupId>
                    <group-id>${groupId!}</group-id>
                </#list>
            </group-ids>
            <requested-shipping-point>${manifestPostalCode}</requested-shipping-point>
            <cpc-pickup-indicator>true</cpc-pickup-indicator>
            <detailed-manifests>true</detailed-manifests>
            <method-of-payment>Account</method-of-payment>
            <manifest-address>
                <manifest-company>${manifestCompanyName}</manifest-company>
                <manifest-name>${manifestName}</manifest-name>
                <phone-number>${manifestPhoneNumber!}</phone-number>
                <address-details>
                    <address-line-1>${manifestAddress1}</address-line-1>
                    <city>${manifestCity}</city>
                    <prov-state>${manifestState}</prov-state>
                    <country-code>${manifestCountry}</country-code>
                    <postal-zip-code>${manifestPostalCode}</postal-zip-code>
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