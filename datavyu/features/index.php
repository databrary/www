<?php
/*
 * File: features/index.php
 * Author: Gladys Chan
 * Description: main content of download page
 */

$title = "Features";
?>
<?php require "../includes/header.php"; ?>
    <img class="feature-title" src="/images/features-is.png" alt="Datavyu is...">
    <section id="datavyu-is">
        <article class="feature">
            <h1>Prepared for sharing</h1>
            <p>Datavyu file formats will be immediately compatible with the forthcoming <a href="http://databrary.org" target="_blank">Databrary</a> data library.</p>
        </article>
        <article class="feature">
            <h1>A proven success</h1>
            <p>Datavyu builds on the success of <a href="http://www.openshapa.org/" target="_blank">OpenSHAPA</a> and the earlier MacSHAPA tool.</p>
        </article>
        <article class="feature">
            <h1>Built by and for behavioral scientists</h1>
            <p>Datavyu and its precursor <a href="http://www.openshapa.org/" target="_blank">OpenSHAPA</a> are used by hundreds of behavioral scientists with diverse interests in behavior, especially development.</p>
        </article>
    </section>

    <img class="feature-title" src="/images/features-can.png" alt="With Datavyu, you can...">
    <section id="datavyu-can">
        <article class="feature">
          <img width="420" src="/images/feature1datastreams.png">
            <h1>View multiple data streams</h1>
            <p>Datavyu supports multiple data streams—video, audio, physiology, motion tracking, eye tracking—and links them together with a flexible, extensible coding spreadsheet that enables time-locked coding and visualization.</p>
        </article>
        <article class="feature">
          <video width="420" height="" controls>
            <source src="/images/feature2hand.mp4" type="video/mp4">
			<source src="/images/feature2hand.ogg" type="video/ogg">
            Your browser does not support the video tag.
          </video>
            <h1>Record observations</h1>
            <p>Keyboard shortcuts and user-defined scripts let you navigate quickly and iteratively through data streams, adding comments, codes, and interpretations. Utterly flexible, user-defined codes enable researchers with widely differing needs to use the same tools.</p>
        </article>
        <article class="feature" style="clear:left;">
          <video width="420" height="" controls>
            <source src="/images/feature3scripts.mp4" type="video/mp4">
			<source src="/images/feature3scripts.ogg" type="video/ogg">
            Your browser does not support the video tag.
          </video>
            <h1>Automate data extraction, analysis</h1>
            <p>Script higher-order analyses in <a href="http://www.ruby-lang.org/">Ruby</a> or <a href="http://www.r-project.org/">R</a> or export data for statistical analysis. Scripting also ensures that multi-step data cleaning or manipulation procedures run the same way every time, increasing data reliability and reducing errors.</p>
        </article>
        <article class="feature">
          <video width="420" height="" controls>
            <source src="/images/feature4editor.mp4" type="video/mp4">
			<source src="/images/feature4editor.ogg" type="video/ogg">
            Your browser does not support the video tag.
          </video>
            <h1>Build on prior analyses</h1>
            <p>By adding new data columns, you can build on prior work. Enhance it. Compare reliability between coders.</p>
        </article>
    </section>
<?php require "../includes/footer.php"; ?>
