require 'digest/md5'

# ソルトを利用してパスワードをハッシュ化
def passwd_to_hash_by_salt(raw_passwd, salt)
  Digest::MD5.hexdigest(salt + raw_passwd)
end

# ソルトを生成してパスワードをハッシュ化
def passwd_to_hash(raw_passwd)
  salt = Digest::MD5.hexdigest(Random.new.bytes(20))
  hashed_passwd = passwd_to_hash_by_salt(raw_passwd, salt)
  [salt, hashed_passwd]
end

# パスワードが正しいか判定する
def passwd_correct?(trial_passwd, db_hashed_passwd, salt)
  trial_hashed_passwd = Digest::MD5.hexdigest(salt + trial_passwd)
  trial_hashed_passwd == db_hashed_passwd
end
