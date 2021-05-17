#!/bin/bash

echo "Covid-19 2021 legfrisebb adatok"
echo "-------------------------"
curl "https://api.apify.com/v2/key-value-stores/RGEUeKe60NjU16Edo/records/LATEST?disableRedirect=true" > adat.txt
echo "-------------------------"
echo "Az adatok frissültek"
echo "-------------------------"
echo "Ha szeretne többet megtudni:"
echo "-e összes eset       -h elhunytak száma"
echo "-g gyógyultak száma  -a aktív fetőzöttek"
echo "-------------------------"
 while getopts "ehga"  opt; do
        case ${opt} in
                e ) echo "Az összes eset száma:"
                         echo  $(grep "infected" adat.txt)|cut -c 12-18

;;
                h ) echo "Az összes elhunyt:"
                        echo $(grep "deceased" adat.txt)|cut -c 12-17
;;
                g ) echo "A Gyógyultak száma:"
                        echo $(grep "recovered" adat.txt)|cut -c 13-19
;;
                a ) echo "AZ aktív fertőzöttek száma:"
                        echo $(grep "activeInfected" adat.txt)|cut -c 18-24
;;
        esac
done
