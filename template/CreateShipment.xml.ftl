<#escape x as x?xml>
<@compress single_line=true>
        <?xml version="1.0" encoding="utf-8"?>
        <shipment xmlns="http://www.canadapost.ca/ws/shipment-v8">
            <group-id>${facilityId}</group-id>
            <requested-shipping-point>${facilityPostalCode}</requested-shipping-point>
            <delivery-spec>
                <service-code>${serviceCode}</service-code>
                <sender>
                    <company>${sender.company}</company>
                    <contact-phone>${sender.phone}</contact-phone>
                    <address-details>
                        <address-line-1>${sender.address1}</address-line-1>
                        <city>${sender.city}</city>
                        <prov-state>${sender.state}</prov-state>
                        <country-code>${sender.country}</country-code>
                        <postal-zip-code>${sender.postalCode}</postal-zip-code>
                    </address-details>
                </sender>

                <destination>
                    <company>${destination.company}</company>
                    <client-voice-number>${destination.phone}</client-voice-number>
                    <address-details>
                        <address-line-1>${destination.address1}</address-line-1>
                        <city>${destination.city}</city>
                        <prov-state>${destination.state}</prov-state>
                        <country-code>${destination.country}</country-code>
                        <postal-zip-code>${destination.postalCode}</postal-zip-code>
                    </address-details>
                </destination>

                <parcel-characteristics>
                    <weight>${weight}</weight>
                    <dimensions>
                        <length>${dimensions.length}</length>
                        <width>${dimensions.width}</width>
                        <height>${dimensions.height}</height>
                    </dimensions>
                </parcel-characteristics>

                <customs>
                    <sku-list>
                        <item>
                            <customs-number-of-units>${shipmentItemQuantity!}</customs-number-of-units>
                            <customs-description>${productName!}</customs-description>
                            <unit-weight>${weight!}</unit-weight>
                            <customs-value-per-unit>${productPriceValue!}</customs-value-per-unit>
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
                    <contract-id>${contractId}</contract-id>
                    <intended-method-of-payment>Account</intended-method-of-payment>
                </settlement-info>
            </delivery-spec>
        </shipment>
    </@compress>
</#escape>