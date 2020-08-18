{**
 * templates/frontend/pages/catalogSeries.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of series in the catalog.
 *
 * @uses $allSeries Array List of series being viewed
 *}
{include file="frontend/components/header.tpl" pageTitle="plugins.block.browse.series"}

<div class="page page_catalog_seriesIndex">

	{* Breadcrumb *}
	{include file="frontend/components/breadcrumbs_catalog.tpl" type="series" currentTitleKey="plugins.block.browse.series"}

	<h2>
		{translate key="plugins.block.browse.series"}
	</h2>

	{* Index with series *}
	<div class="seriesIndex">
	<ul>

		{* Series *}
		{if !empty($allSeries)}

		{foreach from=$allSeries item="series"}
		<li>

		<div class="imageDescription">

	{* Image and description *}

			<div class="cover"> <a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="series" path=$series->getPath()|escape}">
			<img src="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="thumbnail" type="series" id=$series->getId()|escape}" alt="{$series->getLocalizedFullTitle()|escape}" /></a>
			</div>

			<div class="metadata">
			<h3><a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="series" path=$series->getPath()|escape}"> {$series->getLocalizedFullTitle()|escape}</a></h3>

			<div class="description">{$series->getLocalizedDescription()|strip_unsafe_html|truncate:800}</div>

			{if $series->getPrintISSN()}
			<div class="printISSN">{translate key="catalog.manage.series.printIssn"} {$series->getPrintISSN()|escape}</div>{/if}

			{if $series->getOnlineISSN()}
			<div class="onlineISSN">{translate key="catalog.manage.series.onlineIssn"} {$series->getOnlineISSN()|escape}</div>{/if}

			</div>

		</li>
		{/foreach}

		{/if}
	</ul>
	</div>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
