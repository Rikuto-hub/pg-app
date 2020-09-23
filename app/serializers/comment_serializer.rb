class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :account_name, :article_id
end
