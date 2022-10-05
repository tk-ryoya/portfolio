module ApplicationHelper
  def default_meta_tags
    {
      site: '矢倉小野田整骨院',
      title: '予約サービス',
      reverse: true,
      separator: '|',
      description: '親の代から続く30年以上の歴史がある整骨院です。 施術以外にも健康管理や、健康維持の仕方などをアドバイスします。',
      keywords: '',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('/images/favicon.ico.png') },
        { href: image_url(''), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: '矢倉小野田整骨院',
        title: '予約サービス',
        description: '親の代から続く30年以上の歴史がある整骨院です。 施術以外にも健康管理や、健康維持の仕方などをアドバイスします。',
        type: 'website',
        url: request.original_url,
        image: image_url('/images/ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ツイッターのアカウント名',
      },
      fb: {
        app_id: '¥facebookのID'
      }
    }
  end
end
