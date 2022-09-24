# frozen_string_literal=> true

WORD_CLASS = {
  'IC' => '感嘆詞',
  'J' => '語尾',
  'MAG' => '副詞',
  'MAJ' => '接続助詞',
  'MM' => '限定詞',
  'NA' => 'Unknown',
  'NNB' => '依存名詞',
  'NNBC' => '依存名詞',
  'NNG' => '一般名詞',
  'NNP' => '固有名詞',
  'NP' => '代名詞',
  'NR' => '数詞',
  'SC' => 'セパレーター',
  'SE' => '省略記号',
  'SF' => '句点',
  'SH' => '漢字',
  'SL' => '外国語',
  'SN' => '数',
  'SP' => 'スペース',
  'SSC' => 'Closing brackets',
  'SSO' => 'Opening brackets',
  'SY' => 'Other symbol',
  'UNA' => 'Unknown',
  'UNKNOWN' => 'Unknown',
  'VA' => '形容詞',
  'VCN' => '否定指定子',
  'VCP' => '肯定指定子',
  'VSV' => 'Unknown',
  'VV' => '動詞',
  'VX' => '補助用言',
  'XPN' => '接頭辞',
  'XR' => '語幹',
  'XSA' => '形容詞の接尾辞',
  'XSN' => '名詞の接尾辞',
  'XSV' => '動詞の接尾辞',
  'JKB' => '副詞格助詞',
  'JKG' => '冠形格助詞',
  'JX' => '補助詞',
  'EF' => '終結語尾',
  'ETM' => '連体形語尾',
  'JC' => '接続助詞',
  'JKO' => '目的格助詞',
  'JKQ' => '引用格助詞',
  'JKS' => '主格助詞',
  'EC' => '接続語尾',
  'EP' => '先語末語尾',
  'ETM' => '連体形語尾',
  'ETN' => '名詞形전성語尾（他の品詞に役割が変わる語尾）'
}

TRANSLATE_TARGETS = %w[
  MAG
  VV
  NNP
  NNG
  NP
  VA
  MAJ
  MM
  NR
]

STEM_TARGETS = %w[
  VV
  VA
  XSA
  NP
]
