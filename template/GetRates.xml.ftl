<#escape x as x?xml>
<@compress single_line=true>
        <?xml version="1.0" encoding="utf-8"?>
        <mailing-scenario xmlns ="http://www.canadapost.ca/ws/ship/rate-v4">
            <customer-number>${customerNumberOpt.optionValue}</customer-number>
            <contract-id>${contractIdOpt.optionValue}</contract-id>
            <parcel-characteristics>
                <weight>${weight}</weight>
            </parcel-characteristics>
            <services>
                <service-code>${gatewayMethod.gatewayServiceCode}</service-code>
            </services>
            <origin-postal-code>${originPostalAddress.postalCode}</origin-postal-code>
            <destination>
                <domestic>
                    <postal-code>${destPostalAddress.postalCode}</postal-code>
                </domestic>
            </destination>
        </mailing-scenario>
</@compress>
</#escape>