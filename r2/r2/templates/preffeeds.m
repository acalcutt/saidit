## The contents of this file are subject to the Common Public Attribution
## License Version 1.0. (the "License"); you may not use this file except in
## compliance with the License. You may obtain a copy of the License at
## http://code.reddit.com/LICENSE. The License is based on the Mozilla Public
## License Version 1.1, but Sections 14 and 15 have been added to cover use of
## software over a computer network and provide for limited attribution for the
## Original Developer. In addition, Exhibit A has been modified to be
## consistent with Exhibit B.
##
## Software distributed under the License is distributed on an "AS IS" basis,
## WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
## the specific language governing rights and limitations under the License.
##
## The Original Code is reddit.
##
## The Original Developer is the Initial Developer.  The Initial Developer of
## the Original Code is reddit Inc.
##
## All portions of the code written by reddit are Copyright (c) 2006-2015
## reddit Inc. All Rights Reserved.
###############################################################################

<%!
   from r2.models import make_feedurl
   from r2.lib.template_helpers import get_domain
   from r2.lib.filters import safemarkdown

   # CUSTOM: bugfix
   from r2.config import feature
%>
<div class="instructions private-feeds">
<h1>${_("Private RSS feeds")}</h1>

${unsafe(safemarkdown(_("On this page are links to private RSS feeds so that you can get listings of your content (personalized front page, message panel, saved listing, etc.) without having to deal with cookies or other auth.")))}
${unsafe(safemarkdown(_("Keep in mind that these urls are intended to be private, so **share at your own risk.**")))}
${unsafe(safemarkdown(_("All feeds are invalidated if you change your password, however.")))}

<%def name="feedbuttons(path)">
<%
     domain = get_domain(subreddit = False)
     scheme = "https" if feature.is_enabled("force_https") else "http"
 %>
  <a class="feedlink rss-link"
     href="${scheme}://${domain}${make_feedurl(c.user, path, 'rss')}">
    RSS
  </a>
  <a class="feedlink json-link"
     href="${scheme}://${domain}${make_feedurl(c.user, path, 'json')}">
    JSON
  </a>
</%def>

<table class="preftable">
  <tr>
    <th>private listings</th>
    <td class="prefright">
      <%self:feedbuttons path="/"></%self:feedbuttons>
      ${_("your front page")}
      <br/>
      <%self:feedbuttons path="/saved"></%self:feedbuttons>
      ${_("your saved links")}
    </td>
  </tr>
  <tr>
    <th>private profile pages</th>
    <td class="prefright">
      <%self:feedbuttons path="/user/${c.user.name}/upvoted"></%self:feedbuttons>
      ${_("links you've upvoted")}
      <br/>
      <%self:feedbuttons path="/user/${c.user.name}/downvoted"></%self:feedbuttons>
      ${_("links you've downvoted")}
      <br/>
      <%self:feedbuttons path="/user/${c.user.name}/hidden"></%self:feedbuttons>
      ${_("links you've hidden")}
    </td>
  </tr>
   <tr>
    <th>your inbox</th>
    <td class="prefright">
      <%self:feedbuttons path="/message/inbox/"></%self:feedbuttons>
      ${_("everything")}
      <br/>
      <%self:feedbuttons path="/message/unread/"></%self:feedbuttons>
      ${_("unread messages")}
      <br/>
      <%self:feedbuttons path="/message/messages/"></%self:feedbuttons>
      ${_("messages only")}
      <br/>
      <%self:feedbuttons path="/message/comments/"></%self:feedbuttons>
      ${_("comment replies only")}
      <br/>
      <%self:feedbuttons path="/message/selfreply"></%self:feedbuttons>
      ${_("self-post replies only")}
      <br>
      <%self:feedbuttons path="/message/mentions"></%self:feedbuttons>
      ${_("mentions of your username only")}
    </td>
   </tr>
   %if c.user.is_moderator_somewhere:
   <tr>
    <th>your moderator inbox</th>
    <td class="prefright">
      <%self:feedbuttons path="/message/moderator/inbox/"></%self:feedbuttons>
      ${_("everything")}
      <br/>
      <%self:feedbuttons path="/message/moderator/unread/"></%self:feedbuttons>
      ${_("unread messages")}
    </td>
  </tr>
  <tr>
    <th>moderator listings</th>
    <td class="prefright">
      <%self:feedbuttons path="/${g.brander_community_abbr}/mod/about/modqueue/"></%self:feedbuttons>
      ${_("modqueue")}
      <br/>
      <%self:feedbuttons path="/${g.brander_community_abbr}/mod/about/reports/"></%self:feedbuttons>
      ${_("reports")}
      <br/>
      <%self:feedbuttons path="/${g.brander_community_abbr}/mod/about/spam/"></%self:feedbuttons>
      ${_("spam")}
      <br/>
      <%self:feedbuttons path="/${g.brander_community_abbr}/mod/about/edited/"></%self:feedbuttons>
      ${_("edited")}
      <br/>
      <%self:feedbuttons path="/${g.brander_community_abbr}/mod/about/log/"></%self:feedbuttons>
      ${_("moderation log")}
      <br/>
      <%self:feedbuttons path="/${g.brander_community_abbr}/mod/about/unmoderated/"></%self:feedbuttons>
      ${_("unmoderated posts")}
    </td>
  </tr>
  %endif
</table>
</div>
