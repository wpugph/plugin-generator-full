<?php
/**
 * Plugin Name: WordPress Plugin Template
 * Version: 1.0.0
 * Plugin URI: https://carl.alber2.com/
 * Description: This is your starter template for your next WordPress plugin.
 * Author: Carl A
 * Author URI: https://carl.alber2.com/
 * Requires at least: 4.0
 * Tested up to: 4.0
 *
 * Text Domain: wordpress-plugin-template
 * Domain Path: /languages/
 *
 * @package WordPress Plugin Template
 * @author Carl A
 * @since 1.0.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

// Load plugin class files.
require_once( 'includes/class-wordpress-plugin-template.php' );
require_once( 'includes/class-wordpress-plugin-template-settings.php' );

// Load plugin libraries.
require_once( 'includes/lib/class-wordpress-plugin-template-admin-api.php' );
require_once( 'includes/lib/class-wordpress-plugin-template-post-type.php' );
require_once( 'includes/lib/class-wordpress-plugin-template-taxonomy.php' );

/**
 * Returns the main instance of WordPress_Plugin_Template to prevent the need to use globals.
 *
 * @since  1.0.0
 * @return object WordPress_Plugin_Template
 */
function wordpress_plugin_template() {
	// Plugin main variables.
	$latest_plugin_version = '1.0.0';
	$settings_prefix = 'plg1_';

	$pluginoptions = array(
		'settings_prefix' => $settings_prefix,
	);

	$instance = Atest_2::instance( __FILE__,
		$latest_plugin_version,
		$pluginoptions
	);

	if ( is_null( $instance->settings ) ) {
		$instance->settings = Atest_2_Settings::instance( $instance );
	}

	return $instance;
}

wordpress_plugin_template();
