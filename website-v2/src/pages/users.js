/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @format
 */

const Container = require(process.cwd() + '/core/AltContainer');
const React = require('react');

const siteConfig = require(process.cwd() + '/siteConfig.js');

const Layout = require('@theme/Layout');

class Users extends React.Component {
  render() {
    const showcase = siteConfig.customFields.users.map(user => {
      return (
        <a href={user.infoLink} key={user.caption}>
          <img src={user.image} title={user.caption} />
        </a>
      );
    });

    return (
      <div className="mainContainer">
        <Container padding={['bottom', 'top']}>
          <div className="showcaseSection">
            <div className="prose">
              <h1>Who's Using Relay?</h1>
              <p>Relay is used by many folks</p>
            </div>
            <div className="logos">{showcase}</div>
            <p>Are you using this project?</p>
            <a
              href="https://github.com/facebook/relay/edit/master/website/siteConfig.js"
              className="button">
              Add your project
            </a>
          </div>
        </Container>
      </div>
    );
  }
}

export default props => (
  <Layout>
    <Users {...props} />
  </Layout>
);
