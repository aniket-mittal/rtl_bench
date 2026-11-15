// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 83;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06718 dut (
    .clk(clk),
    .addr0(in_vec[82:75]),
    .ce0(in_vec[74:74]),
    .d0(in_vec[73:10]),
    .we0(in_vec[9:9]),
    .addr1(in_vec[8:1]),
    .ce1(in_vec[0:0]),
    .q0(out_vec[127:64]),
    .q1(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 83'h5bf8fbfe15221ca7c005b;
    stim[1] = 83'h7eef92d2864d3e348d9f6;
    stim[2] = 83'h53970b2e5db9018c8b6fd;
    stim[3] = 83'h58176c5d622ebeccb9d7e;
    stim[4] = 83'h2ff37ec4e049cb5b16ff8;
    stim[5] = 83'h4519c02e8e956928924a7;
    stim[6] = 83'h2a9be6f713bdd2301b5b9;
    stim[7] = 83'h4cefebe3f76cd842ebe72;
    stim[8] = 83'h03ad748694784273f42a7;
    stim[9] = 83'h06f95f1dab7989512c187;
    stim[10] = 83'h31497336f0b1b58c370a4;
    stim[11] = 83'h23318383669006186ff4c;
    stim[12] = 83'h614f715ff540a405f1782;
    stim[13] = 83'h1ce4adc9e86504bca79ac;
    stim[14] = 83'h3972e178f7962cde49e56;
    stim[15] = 83'h406585970a6d59441ec39;
    stim[16] = 83'h159dd2537867ccd8e47c6;
    stim[17] = 83'h42443b855c563f745d009;
    stim[18] = 83'h5b52d21c8a9fd6530bf9a;
    stim[19] = 83'h573048148919440f71e1f;
    stim[20] = 83'h02157ed1d5214e00255b4;
    stim[21] = 83'h1233805eb405e353ea9f1;
    stim[22] = 83'h0903f53ba16aaa2ec5abb;
    stim[23] = 83'h7a3dea093792def73008e;
    stim[24] = 83'h45b55318952180dcdf690;
    stim[25] = 83'h65297a4c0ca0d635bd82b;
    stim[26] = 83'h63041bed90f8e5af1707f;
    stim[27] = 83'h1e769026a80c369432707;
    stim[28] = 83'h4e9a1a971bd47b1d348a4;
    stim[29] = 83'h748abe04bab0954564520;
    stim[30] = 83'h57e997b4750798236f2c5;
    stim[31] = 83'h3eacb65b77f2832ec8fc1;
    stim[32] = 83'h3078d8842768ef2dbece2;
    stim[33] = 83'h1d19d0c5cdd8a2fc0c1c2;
    stim[34] = 83'h0f209d4c970b41c76a21d;
    stim[35] = 83'h0ed0874c805807268531f;
    stim[36] = 83'h4cd040ac0e4126ca54eb5;
    stim[37] = 83'h6f20ad90a94cfca82ded3;
    stim[38] = 83'h1875fab108d8f6aca2af7;
    stim[39] = 83'h74b9dea23c06d9a6923b5;
    stim[40] = 83'h1286c52e6a9c89f3cd76e;
    stim[41] = 83'h50e1f97e79dc156938fd9;
    stim[42] = 83'h1f0a48c0eac9ab5577b4a;
    stim[43] = 83'h732a11d2ec24154ab113c;
    stim[44] = 83'h04291ee8a89b420211147;
    stim[45] = 83'h788176c24461f904dcebf;
    stim[46] = 83'h5e09e3dddb54b6815609c;
    stim[47] = 83'h20b30813bb478791a6ee3;
    stim[48] = 83'h2ef245d3cdd86ab44fa98;
    stim[49] = 83'h3886c6b7af79f013bb757;
    stim[50] = 83'h4d50ccdaf6d42b5d6b435;
    stim[51] = 83'h73e5a0aff27c4367cbe6f;
    stim[52] = 83'h32b891db125d8e8b52c5c;
    stim[53] = 83'h7510edccf1ba8b8f575f4;
    stim[54] = 83'h269a4a5b390e13a51951d;
    stim[55] = 83'h4c151b049ab8f63da9ff0;
    stim[56] = 83'h559ecb1ff6404dc49597a;
    stim[57] = 83'h213911027a3cf4c89ee60;
    stim[58] = 83'h457375548081fd213e9e1;
    stim[59] = 83'h3fe1f40e159f935a00cc8;
    stim[60] = 83'h331291670d9d0080c2ebc;
    stim[61] = 83'h2f1030370bf30ac8b7720;
    stim[62] = 83'h72f826e3ffa455f9f2e13;
    stim[63] = 83'h5dcebc218f0ba03caeca6;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 128'hcdfb1381272d6c5bxxxxxxxxxxxxxxxx;
      expv[6] = 128'hcdfb1381272d6c5bxxxxxxxxxxxxxxxx;
      expv[7] = 128'hcdfb1381272d6c5bxxxxxxxxxxxxxxxx;
      expv[8] = 128'hbfaf8fddb3610bafxxxxxxxxxxxxxxxx;
      expv[9] = 128'hbfaf8fddb3610bafxxxxxxxxxxxxxxxx;
      expv[10] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 128'h3dc57fd5029017c5xxxxxxxxxxxxxxxx;
      expv[14] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 128'hcb85e3de58b37927xxxxxxxxxxxxxxxx;
      expv[16] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 128'h4b48722a7f594c2fxxxxxxxxxxxxxxxx;
      expv[20] = 128'h4b48722a7f594c2fxxxxxxxxxxxxxxxx;
      expv[21] = 128'h4b48722a7f594c2fxxxxxxxxxxxxxxxx;
      expv[22] = 128'h4b48722a7f594c2fxxxxxxxxxxxxxxxx;
      expv[23] = 128'h4b48722a7f594c2fxxxxxxxxxxxxxxxx;
      expv[24] = 128'h4b48722a7f594c2fxxxxxxxxxxxxxxxx;
      expv[25] = 128'h4b48722a7f594c2fxxxxxxxxxxxxxxxx;
      expv[26] = 128'h4b48722a7f594c2fxxxxxxxxxxxxxxxx;
      expv[27] = 128'h4b48722a7f594c2fxxxxxxxxxxxxxxxx;
      expv[28] = 128'hda409aa030da50c9xxxxxxxxxxxxxxxx;
      expv[29] = 128'hda409aa030da50c9xxxxxxxxxxxxxxxx;
      expv[30] = 128'hda409aa030da50c9xxxxxxxxxxxxxxxx;
      expv[31] = 128'ha65ed1d41e608dbcxxxxxxxxxxxxxxxx;
      expv[32] = 128'ha65ed1d41e608dbcxxxxxxxxxxxxxxxx;
      expv[33] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 128'h421d3201601c9a14xxxxxxxxxxxxxxxx;
      expv[37] = 128'h4102b039049b2953xxxxxxxxxxxxxxxx;
      expv[38] = 128'h4102b039049b2953xxxxxxxxxxxxxxxx;
      expv[39] = 128'hd7eac42363dab28axxxxxxxxxxxxxxxx;
      expv[40] = 128'hd7eac42363dab28axxxxxxxxxxxxxxxx;
      expv[41] = 128'hd7eac42363dab28axxxxxxxxxxxxxxxx;
      expv[42] = 128'h87e5f9e77055a4e3xxxxxxxxxxxxxxxx;
      expv[43] = 128'h87e5f9e77055a4e3xxxxxxxxxxxxxxxx;
      expv[44] = 128'h87e5f9e77055a4e3xxxxxxxxxxxxxxxx;
      expv[45] = 128'h87e5f9e77055a4e3xxxxxxxxxxxxxxxx;
      expv[46] = 128'h87e5f9e77055a4e3cdfb1381272d6c5b;
      expv[47] = 128'h87e5f9e77055a4e3cdfb1381272d6c5b;
      expv[48] = 128'h87e5f9e77055a4e3xxxxxxxxxxxxxxxx;
      expv[49] = 128'hc9174f3761aad13exxxxxxxxxxxxxxxx;
      expv[50] = 128'hc9174f3761aad13exxxxxxxxxxxxxxxx;
      expv[51] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 128'h9682bfc9f10d9f2fxxxxxxxxxxxxxxxx;
      expv[53] = 128'h9682bfc9f10d9f2fxxxxxxxxxxxxxxxx;
      expv[54] = 128'h9682bfc9f10d9f2fxxxxxxxxxxxxxxxx;
      expv[55] = 128'h9682bfc9f10d9f2fxxxxxxxxxxxxxxxx;
      expv[56] = 128'h9682bfc9f10d9f2fxxxxxxxxxxxxxxxx;
      expv[57] = 128'h9682bfc9f10d9f2fxxxxxxxxxxxxxxxx;
      expv[58] = 128'h9682bfc9f10d9f2fxxxxxxxxxxxxxxxx;
      expv[59] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 128'he09b8ffe9157e7cbxxxxxxxxxxxxxxxx;
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
