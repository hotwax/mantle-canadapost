<#escape x as x?xml>
<@compress single_line=true>
        <?xml version="1.0" encoding="utf-8"?>
        <shipment xmlns="http://www.canadapost.ca/ws/shipment-v8">
            <group-id>${facility.facilityName}</group-id>
            <requested-shipping-point>${facilityPostalAddress.postalCode}</requested-shipping-point>
            <delivery-spec>
                <service-code>${gatewayMethod.gatewayServiceCode}</service-code>
                <sender>
                    <company>${originPostalAddress.toName}</company>
                    <contact-phone>${originPhoneNumber}</contact-phone>
                    <address-details>
                        <address-line-1>${originPostalAddress.address1}</address-line-1>
                        <city>${originPostalAddress.city}</city>
                        <prov-state>${originStateGeo.geoCodeAlpha2}</prov-state>
                        <country-code>${originCountryGeo.geoCodeAlpha2}</country-code>
                        <postal-zip-code>${originPostalAddress.postalCode}</postal-zip-code>
                    </address-details>
                </sender>

                <destination>
                    <company>${destPostalAddress.toName}</company>
                    <client-voice-number>${destPhoneNumber}</client-voice-number>
                    <address-details>
                        <address-line-1>${destPostalAddress.address1}</address-line-1>
                        <city>${destPostalAddress.city}</city>
                        <prov-state>${destStateGeo.geoCodeAlpha2}</prov-state>
                        <country-code>${destCountryGeo.geoCodeAlpha2}</country-code>
                        <postal-zip-code>${destPostalAddress.postalCode}</postal-zip-code>
                    </address-details>
                </destination>

                <parcel-characteristics>
                    <weight>${weight}</weight>
                    <#if dimensions?has_content>
                        <dimensions>
                            <length>${dimensions.length}</length>
                            <width>${dimensions.width}</width>
                            <height>${dimensions.height}</height>
                        </dimensions>
                    </#if>
                </parcel-characteristics>

                <customs>
                    <sku-list>
                        <item>
                            <customs-number-of-units>${shipmentItem.quantity!}</customs-number-of-units>
                            <customs-description>${productDetail.productName!}</customs-description>
                            <unit-weight>${unitWeight!}</unit-weight>
                            <customs-value-per-unit>${productPrice.price!}</customs-value-per-unit>
                        </item>
                    </sku-list>
                    <currency>CAD</currency>
                    <reason-for-export>SOG</reason-for-export>
                </customs>
                <preferences>
                    <show-packing-instructions>true</show-packing-instructions>
                    <show-postage-rate>false</show-postage-rate>
                    <show-insured-value>true</show-insured-value>
                </preferences>
                <settlement-info>
                    <contract-id>${contractIdOpt.optionValue}</contract-id>
                    <intended-method-of-payment>Account</intended-method-of-payment>
                </settlement-info>
            </delivery-spec>
        </shipment>
    </@compress>
</#escape>