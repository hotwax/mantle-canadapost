<#escape x as x?xml>
<@compress single_line=true>
        <?xml version="1.0" encoding="utf-8"?>
        <mailing-scenario xmlns ="http://www.canadapost.ca/ws/ship/rate-v4">
            <customer-number>${customerNumber}</customer-number>
            <contract-id>${contractId}</contract-id>
            <parcel-characteristics>
                <weight>${weight}</weight>
            </parcel-characteristics>
            <services>
                <service-code>${serviceCode}</service-code>
            </services>
            <origin-postal-code>${originPostalCode}</origin-postal-code>
            <destination>
                <domestic>
                    <postal-code>${destPostalCode}</postal-code>
                </domestic>
            </destination>
        </mailing-scenario>
</@compress>
</#escape>