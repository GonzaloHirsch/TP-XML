declare variable $userID external;
declare variable $n external;

declare function local:ReturnUser($user) as node()
{
  <user>
  { $user/@Id }
  <name> { data($user/@DisplayName) }  </name>
  <description> { data($user/@AboutMe) } </description>
  <creation>{ data($user/@CreationDate) }</creation>
  <location>{ data($user/@Location) }</location>
  <upvotes>{ data($user/@UpVotes) }</upvotes>
  <downvotes>{ data($user/@DownVotes) }</downvotes>
  <reputation>{ data($user/@Reputation) }</reputation>
  <views>{ data($user/@Views) }</views>
  <badges> 
    {for $badge in doc("badges.xml")//row
    where ($badge/@UserId = $userID)
    return local:badge($badge)}
  
  </badges>
  </user>
  
};

declare function local:badge($badge) as node() {
  <badge>
    {  $badge/@Id  }
    {  $badge/@Class }
    {  $badge/@TagBased  }
    <name> { data($badge/@Name) } </name>
    <created> { data($badge/@Date ) } </created>
  </badge>
};

for $user in doc("Users.xml")//row
where  ($user/@Id = $userID)
return local:ReturnUser($user)





 