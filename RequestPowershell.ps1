
$ObjectURI = @{
	Url = "<URL>"
	EndPoint = "/app/v1/financeiro/vendas?"
	Params = @(
		'periodo=2022-10-1|2022-10-31'
		'periodoObj={"exibicao":"Custom","inicio":"2022-10-01","fim":"2022-10-31"}'
		'&sort=ordem_formatada'
		'&page=1'
		'&per_page=1000'
	)
}
$RequestData = @{
    Uri     = $ObjectURI.Url + $ObjectURI.EndPoint + [string]::Concat($ObjectURI.Params)
    Method  = "GET"
    Headers = @{
        authorization = 'Bearer <Token>'
    }
    
}
$Data = Invoke-WebRequest @RequestData
$Normalized = ($Data.Content | ConvertFrom-Json) | ConvertTo-Json
echo $Normalized
Set-Content "<path>\OutPut.json" $Normalized

