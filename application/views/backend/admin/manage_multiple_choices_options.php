<?php for($i = 0; $i <= $number_of_options; $i++): ?>
    <div class="form-group options">
        <label><?php echo get_phrase('option').' '.$i;?></label>
        <div class="input-group">
            <input type="text" class="form-control" name = "options[]" id="option_<?php echo $i; ?>" placeholder="<?php echo get_phrase('option_').$i; ?>" required>
            <div class="input-group-append">
                <span class="input-group-text">
                <!-- Mengubah pengecekan Menandai jawaban yang benar berdasarkan teks jawaban -->
                    <input type='checkbox' name="correct_answers[]" value=<?php echo ($i+1); ?> 
                    <?php if(in_array($options[$i], $correct_answers)) echo 'checked'; ?>> 
                </span>
            </div>
        </div>
    </div>
<?php endfor; ?>
