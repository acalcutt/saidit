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

<%namespace name="utils" file="utils.m"/>

<div class="sponsored-page">
  <form name="lookup-user" action="" method="get">
    <div class="editor lookup-user">
      <header>
        <h2>look up a user</h2>
      </header>
      <div class="editor-group">
        <%utils:line_field title="${_('search')}" css_class="rounded lookup-user-field">
          <label class="form-group">
            <div class="label">${_('id')}</div>
            <input type="text" name="name" value="${thing.id_user._fullname if thing.id_user else ""}">
          </label>
          <div class='form-group lookup-user-results'>
            <div class="label">name</div>
            %if thing.id_user:
              ${utils.plain_link(thing.id_user.name, "/user/%s/promoted" % thing.id_user.name)}
            %endif
          </div>

          <label class="form-group">
            <div class="label">email</div>
            <input type="text" name="email" value="${thing.email or ""}">
          </label>
          <div class='form-group lookup-user-results'>
            <div class="label">name(s)</div>
            %for user in thing.email_users:
              <div>
                ${utils.plain_link(user.name, "/user/%s/promoted" % user.name)}
              </div>
            %endfor
          </div>
        </%utils:line_field>
      </div>
      <footer class="buttons">
        <button type="submit">search</button>
      </footer>
    </form>
  </div>
</div>
