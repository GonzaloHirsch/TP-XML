declare variable $userID external;
declare variable $n external;

declare function local:ReturnUser($user) as node()
{
  
  <user id="{data($user/@Id)}" >
  <name> {data($user/@DisplayName) }  </name>
  <description> { data($user/@AboutMe) } </description>
  <creation>{ data($user/@CreationDate) }</creation>
  <location>{ data($user/@Location) }</location>
  <views>{ data($user/@Views) }</views>
  <upvotes>{ data($user/@UpVotes) }</upvotes>
  <downvotes>{ data($user/@DownVotes) }</downvotes>
  <reputation>{ data($user/@Reputation) }</reputation>
  
  
  
  <badges> 
    {
      for $badge in doc("badges.xml")//row
      where ($badge/@UserId = $userID)
      return local:badge($badge)}
  </badges>
  
  
  <posts>
    {
        for $N in (1 to $n)
        return ( for $post in doc("Posts.xml")//row
        where ( $post/@OwnerUserId = $userID)
        order by xs:integer($post/@Score) descending, $post/@CreationDate
        return local:post($post) )[xs:integer($N)]
    }
  </posts>
  
  
  <comments>
    {
      for $N in (1 to $n)
      return ( for  $comment in doc("Comments.xml")//row
      where ( $comment/@UserId = $userID)
      order by xs:integer($comment/@Score) descending, $comment/@CreationDate
      return local:comment($comment) )[xs:integer($N)]
    }
  </comments>  
  
  </user>
  
  
};

declare function local:badge($badge) as node() {
  <badge id="{ data($badge/@Id) }" class="{ data($badge/@Class) }" tag_based="{ data($badge/@TagBased) }">
    <name> { data($badge/@Name) } </name>
    <created> { data($badge/@Date ) } </created>
  </badge>
};

declare function local:post($post) as node() {
  <post>
    <text> {   data($post/@Body) } </text>
    <created>{data($post/@CreationDate) } </created>
    <view_count>{data($post/@ViewCount) } </view_count>
    <comment_count>{data($post/@CommentCount) } </comment_count>
    <answer_count>{ data($post/@AnswerCount) } </answer_count>
    <favorite_count>{ data($post/@FavoriteCount) } </favorite_count>
    <score>{ data($post/@Score) } </score>
  </post>
};

declare function local:comment($comment) as node() {
  <comment>
    <text> { data($comment/@Text) } </text>
    <created>{data($comment/@CreationDate) } </created>
    <score>{ data($comment/@Score) } </score>
  </comment>
};

declare function local:error() as node() {
  <error>User {$userID} is inexistent.</error>
};

<result>{
  if (some $user in doc("Users.xml")//row satisfies ($user/@Id = $userID))
  then for $user in doc("Users.xml")//row
  where  ($user/@Id = $userID)
  return local:ReturnUser($user)
  else local:error()
}

</result>
