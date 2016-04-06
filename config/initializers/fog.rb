CarrierWave.configure do |config|
	config.fog_credentials = {
		provider: 							'AWS',
		aws_access_key_id: 			'AKIAJLQDMAYB3QEFU7QQ',
		aws_secret_access_key: 	'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',
		region: 								'ap-northeast-2',
	}
	config.fog_directory = 'knulikelion'
end