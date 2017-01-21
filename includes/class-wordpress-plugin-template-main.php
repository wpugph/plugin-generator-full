<?php
/**
 * Contains the mian functionalities, customization will mainly happen here.
 *
 * @package WordPress Plugin Template \ Main Functionalities
 * @author Carl A
 * @since 1.0.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Class used for the main plugin functions.
 */
class WordPress_Plugin_Template_Main {

	/**
	 * Wrapper function to register a new post type.
	 *
	 * @param  string $post_type	Post type name.
	 * @param  string $plural		Post type item plural name.
	 * @param  string $single		Post type item single name.
	 * @param  string $description	Description of post type.
	 * @param  string $options		Options when registering a post type.
	 * @return object              Post type class object.
	 */
	public function register_post_type( $post_type = '', $plural = '', $single = '', $description = '', $options = array() ) {

		if ( ! $post_type || ! $plural || ! $single ) {
			return;
		}
		$post_type = new WordPress_Plugin_Template_Post_Type( $post_type, $plural, $single, $description, $options );

		return $post_type;
	}

	/**
	 * Wrapper function to register a new taxonomy.
	 *
	 * @param  string $taxonomy   Taxonomy name.
	 * @param  string $plural     Taxonomy single name.
	 * @param  string $single     Taxonomy plural name.
	 * @param  array  $post_types Post types to which this taxonomy applies.
	 * @param  array  $taxonomy_args Args when cerating a taxonomy.
	 * @return object             Taxonomy class object.
	 */
	public function register_taxonomy( $taxonomy = '', $plural = '', $single = '', $post_types = array(), $taxonomy_args = array() ) {

		if ( ! $taxonomy || ! $plural || ! $single ) {
			return;
		}
		$taxonomy = new WordPress_Plugin_Template_Taxonomy( $taxonomy, $plural, $single, $post_types, $taxonomy_args );

		return $taxonomy;
	}

}
