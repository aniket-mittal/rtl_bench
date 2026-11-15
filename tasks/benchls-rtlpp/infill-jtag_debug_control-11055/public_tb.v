// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11055 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h05192285e46;
    stim[1] = 42'h20c928d093a;
    stim[2] = 42'h0d6bb4560ed;
    stim[3] = 42'h0cfd4717845;
    stim[4] = 42'h205e34f7402;
    stim[5] = 42'h1d7bbc86ee6;
    stim[6] = 42'h182b1aa9317;
    stim[7] = 42'h2e1dd4c2887;
    stim[8] = 42'h25ab75fef35;
    stim[9] = 42'h3caeaba5716;
    stim[10] = 42'h173b6ab422d;
    stim[11] = 42'h0c36292ae7a;
    stim[12] = 42'h04dd42e709a;
    stim[13] = 42'h2cdc337061f;
    stim[14] = 42'h1956bae41fd;
    stim[15] = 42'h0d6379f7809;
    stim[16] = 42'h0ab91f3a48f;
    stim[17] = 42'h2778aa1268b;
    stim[18] = 42'h3b4d2eae56a;
    stim[19] = 42'h1c1907d1ae8;
    stim[20] = 42'h07d48803820;
    stim[21] = 42'h01ff0eb6034;
    stim[22] = 42'h3810716771c;
    stim[23] = 42'h0cf7e92794c;
    stim[24] = 42'h1f3a2b4c567;
    stim[25] = 42'h2cf6dc02705;
    stim[26] = 42'h1fd89f27793;
    stim[27] = 42'h0593d4be3c9;
    stim[28] = 42'h366581b84da;
    stim[29] = 42'h1d69284e371;
    stim[30] = 42'h0c600b28b0c;
    stim[31] = 42'h0a6cae6af9a;
    stim[32] = 42'h19a20b06359;
    stim[33] = 42'h2a69a44f7be;
    stim[34] = 42'h07b6e056010;
    stim[35] = 42'h3f265cc15b3;
    stim[36] = 42'h01ffdf3c003;
    stim[37] = 42'h3655a914fd5;
    stim[38] = 42'h3be146d7926;
    stim[39] = 42'h0156177ef63;
    stim[40] = 42'h0d6c66753c9;
    stim[41] = 42'h19dd4225668;
    stim[42] = 42'h26c31099f9d;
    stim[43] = 42'h17d6eaa73af;
    stim[44] = 42'h0d006d1c454;
    stim[45] = 42'h17e0a31c400;
    stim[46] = 42'h1a5fa7ac753;
    stim[47] = 42'h3877a600632;
    stim[48] = 42'h29e97a15587;
    stim[49] = 42'h0259cf02a78;
    stim[50] = 42'h0cc4ee6a678;
    stim[51] = 42'h00084c1b99c;
    stim[52] = 42'h1367f7f7528;
    stim[53] = 42'h1b0945c4cc9;
    stim[54] = 42'h1abda7ca3cf;
    stim[55] = 42'h21b6af7736a;
    stim[56] = 42'h1230cfadb1e;
    stim[57] = 42'h11fd79e0d09;
    stim[58] = 42'h10bf534bd73;
    stim[59] = 42'h0f160f9b6de;
    stim[60] = 42'h19d413012c7;
    stim[61] = 42'h186ffd3c892;
    stim[62] = 42'h2ae9d95896b;
    stim[63] = 42'h26c774f5e18;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxx00;
      expv[4] = 48'hxxxxxxxxxx00;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'hd7bbc86ee440;
      expv[7] = 48'hd7bbc86ee400;
      expv[8] = 48'hd7bbc86ee400;
      expv[9] = 48'hd7bbc86ee400;
      expv[10] = 48'hd7bbc86ee400;
      expv[11] = 48'h73b6ab422c02;
      expv[12] = 48'h73b6ab422c00;
      expv[13] = 48'h4dd42e709801;
      expv[14] = 48'h4dd42e709800;
      expv[15] = 48'h4dd42e709800;
      expv[16] = 48'h4dd42e709800;
      expv[17] = 48'h4dd42e709800;
      expv[18] = 48'h778aa1268800;
      expv[19] = 48'h778aa1268800;
      expv[20] = 48'h778aa1268800;
      expv[21] = 48'h778aa1268800;
      expv[22] = 48'h778aa1268800;
      expv[23] = 48'h778aa1268800;
      expv[24] = 48'h778aa1268800;
      expv[25] = 48'h778aa1268800;
      expv[26] = 48'hcf6dc0270500;
      expv[27] = 48'hcf6dc0270400;
      expv[28] = 48'h593d4be3c804;
      expv[29] = 48'h593d4be3c800;
      expv[30] = 48'hd69284e37100;
      expv[31] = 48'hd69284e37000;
      expv[32] = 48'hd69284e37000;
      expv[33] = 48'h9a20b0635840;
      expv[34] = 48'h9a20b0635800;
      expv[35] = 48'h7b6e05601002;
      expv[36] = 48'h7b6e05601000;
      expv[37] = 48'h1ffdf3c00040;
      expv[38] = 48'h1ffdf3c00000;
      expv[39] = 48'h1ffdf3c00000;
      expv[40] = 48'h156177ef6040;
      expv[41] = 48'h156177ef6000;
      expv[42] = 48'h156177ef6000;
      expv[43] = 48'h156177ef6000;
      expv[44] = 48'h156177ef6000;
      expv[45] = 48'hd006d1c45400;
      expv[46] = 48'hd006d1c45400;
      expv[47] = 48'hd006d1c45400;
      expv[48] = 48'h877a60063000;
      expv[49] = 48'h877a60063000;
      expv[50] = 48'h877a60063000;
      expv[51] = 48'h877a60063000;
      expv[52] = 48'h877a60063000;
      expv[53] = 48'h877a60063000;
      expv[54] = 48'h877a60063000;
      expv[55] = 48'h877a60063000;
      expv[56] = 48'h1b6af7736800;
      expv[57] = 48'h1b6af7736800;
      expv[58] = 48'h1b6af7736800;
      expv[59] = 48'h1b6af7736800;
      expv[60] = 48'hf160f9b6dc00;
      expv[61] = 48'hf160f9b6dc00;
      expv[62] = 48'hf160f9b6dc00;
      expv[63] = 48'hf160f9b6dc00;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
