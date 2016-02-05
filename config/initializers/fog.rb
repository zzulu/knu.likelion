CarrierWave.configure do |config|
	config.fog_credentials = {
		provider: 							'AWS',
		aws_access_key_id: 			'AKIAJCJ3U4VFVMNJX2PA',
		aws_secret_access_key: 	'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',
		region: 								'ap-northeast-2',
	}
	config.fog_directory = 'zzulu'
end