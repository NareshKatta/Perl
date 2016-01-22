use JSON;
use Data::Dumper;

my $jsonstring = '{"series":[{"type":"SCATTER","name":"Accounting Quality","marker":"TRUE","pointLabels":"TRUE","data":[{"x":6.09,"y":7.54,"name":"IACI-US"},{"x":12.47,"y":22.17,"name":"MSFT-US"},{"x":12.02,"y":21.89,"name":"GOOGL-US"},{"x":16.5,"y":17,"name":"AKAM-US"},{"x":-17.08,"y":27.1,"name":"FOX-US"},{"x":31.39,"y":0.26,"name":"EBAY-US"},{"x":7.89,"y":26.31,"name":"YNDX-US"},{"x":15.72,"y":-6.12,"name":"BCOR-US"},{"x":11.35,"y":4.86,"name":"AOL-US"}]},{"type":"line","name":"Peer Median Accruals (%)","marker":"FALSE","pointLabels":"FALSE","data":[{"x":11.69,"y":-12.77},{"x":11.69,"y":35.08}]},{"type":"line","name":"Peer Median Net Margin (%)","marker":"FALSE","pointLabels":"FALSE","data":[{"x":-21.93,"y":17},{"x":36.73,"y":17}]}],"title":{"name":"Net Margin vs. Accruals (TTM)"},"labels":[{"q1":"Conservative Accounting"},{"q2":"Aggressive Accounting"},{"q3":"Non-Cash Earnings"},{"q4":"Possible Sandbagging"}],"xAxis":{"title":"Accruals (% Rev)","min":-21.93,"max":36.73},"yAxis":{"title":"Net Margin (%)","min":-12.77,"max":35.08},"legend":"TRUE"}';
eval {
	my $content = decode_json($jsonstring);
	print Dumper($content);
};
if($EVAL_ERROR) {
	print Dumper($EVAL_ERROR);
}

