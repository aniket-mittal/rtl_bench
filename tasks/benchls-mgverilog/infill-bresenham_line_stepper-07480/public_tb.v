// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07480 dut (
    .sys_clk(clk),
    .load(in_vec[71:71]),
    .next_point(in_vec[70:70]),
    .init(in_vec[69:52]),
    .positive(in_vec[51:51]),
    .q(in_vec[50:34]),
    .r(in_vec[33:17]),
    .divisor(in_vec[16:0]),
    .o(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'hd9da8d17c3163c950b;
    stim[1] = 72'h0ba68a558cfe0d6785;
    stim[2] = 72'h896b475171dc6cd68f;
    stim[3] = 72'hdfd35f662fc3094633;
    stim[4] = 72'hc8fdced6c0d8e8a69f;
    stim[5] = 72'h98598b48bf783d3f45;
    stim[6] = 72'h2283cfe7f7a2927ded;
    stim[7] = 72'h328eddbb8ffdfe5de6;
    stim[8] = 72'hb83862f4beaa985c1b;
    stim[9] = 72'h28bbe72d617c544dbe;
    stim[10] = 72'ha39c3f0613f3bcba3a;
    stim[11] = 72'h150a3374dc286a419f;
    stim[12] = 72'h8d79c6d4195ba78cc8;
    stim[13] = 72'h7104aebd57f8a4d131;
    stim[14] = 72'hccb4aa014d9499964b;
    stim[15] = 72'h1f854b81a0cdced9b3;
    stim[16] = 72'hbae2374cb1847b09bb;
    stim[17] = 72'he9a454692f7083f7a4;
    stim[18] = 72'h212dc6ec9878f1e66e;
    stim[19] = 72'h735b90875e03074ede;
    stim[20] = 72'hfbc7ea034f469973e9;
    stim[21] = 72'h6982645679759a8065;
    stim[22] = 72'h3d17f3d431745f3dd3;
    stim[23] = 72'h39f78d651a0166337d;
    stim[24] = 72'hd5eb7b9b5485f99796;
    stim[25] = 72'h3b2ad99100c3b60626;
    stim[26] = 72'hed8edf813755c71d6f;
    stim[27] = 72'hc73e4c59ea9356bcfd;
    stim[28] = 72'h528689d29434912d0d;
    stim[29] = 72'h86bffe13309d7e44cf;
    stim[30] = 72'h80cf61294b67073e40;
    stim[31] = 72'h20903f63339256cafe;
    stim[32] = 72'h875ed17ebb7ed25ad0;
    stim[33] = 72'h750f5f19f4ac544bbf;
    stim[34] = 72'hbde33217dd1682feb4;
    stim[35] = 72'h9b4ddd259d842f55cc;
    stim[36] = 72'h3905054a648f25061f;
    stim[37] = 72'h698fe8f38cab66998c;
    stim[38] = 72'hb073917c00d465f65e;
    stim[39] = 72'h7f205aaa07ed2859ff;
    stim[40] = 72'h2b909d0b0d261d582a;
    stim[41] = 72'hc0fb033b3a0fa4620f;
    stim[42] = 72'h11b2fc77eaa23d1445;
    stim[43] = 72'h56bcf8a7f6d2861cb7;
    stim[44] = 72'hdf707e59380d5f514e;
    stim[45] = 72'hc3f07fb6b0b48c5091;
    stim[46] = 72'h869f206aca730761ba;
    stim[47] = 72'ha31114e470ee788f08;
    stim[48] = 72'ha42f3268660ea0e0f7;
    stim[49] = 72'hde23a262de53b87afd;
    stim[50] = 72'he5707996d96ba9a816;
    stim[51] = 72'h1a894c5c49e138ae41;
    stim[52] = 72'h215e23a7c96602913b;
    stim[53] = 72'ha2c9c8b4619fd9ce06;
    stim[54] = 72'h1827627b62981a0165;
    stim[55] = 72'hb2d1badc28d52b35fb;
    stim[56] = 72'hc44a8835871b301daa;
    stim[57] = 72'h840c49b5aec195a642;
    stim[58] = 72'h7985ee60eaa5f305b7;
    stim[59] = 72'ha10fb9e02fb3c4907a;
    stim[60] = 72'h17142034d0dc60a284;
    stim[61] = 72'ha6e9b65de8d97eee7d;
    stim[62] = 72'h52068ec3f59781f6e8;
    stim[63] = 72'h2f9f6e4fbb82bac165;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h19da8;
      expv[2] = 18'h19da8;
      expv[3] = 18'h096b4;
      expv[4] = 18'h1fd35;
      expv[5] = 18'h08fdc;
      expv[6] = 18'h18598;
      expv[7] = 18'h18598;
      expv[8] = 18'h18598;
      expv[9] = 18'h38386;
      expv[10] = 18'h38386;
      expv[11] = 18'h239c3;
      expv[12] = 18'h239c3;
      expv[13] = 18'h0d79c;
      expv[14] = 18'h32296;
      expv[15] = 18'h0cb4a;
      expv[16] = 18'h0cb4a;
      expv[17] = 18'h3ae23;
      expv[18] = 18'h29a45;
      expv[19] = 18'h29a45;
      expv[20] = 18'h17ff9;
      expv[21] = 18'h3bc7e;
      expv[22] = 18'h03d52;
      expv[23] = 18'h03d52;
      expv[24] = 18'h03d52;
      expv[25] = 18'h15eb7;
      expv[26] = 18'h15eb7;
      expv[27] = 18'h2d8ed;
      expv[28] = 18'h073e4;
      expv[29] = 18'h18a5f;
      expv[30] = 18'h06bff;
      expv[31] = 18'h00cf6;
      expv[32] = 18'h00cf6;
      expv[33] = 18'h075ed;
      expv[34] = 18'h0163e;
      expv[35] = 18'h3de33;
      expv[36] = 18'h1b4dd;
      expv[37] = 18'h1b4dd;
      expv[38] = 18'h2fe45;
      expv[39] = 18'h30739;
      expv[40] = 18'h2a839;
      expv[41] = 18'h2a839;
      expv[42] = 18'h00fb0;
      expv[43] = 18'h00fb0;
      expv[44] = 18'h340e1;
      expv[45] = 18'h1f707;
      expv[46] = 18'h03f07;
      expv[47] = 18'h069f2;
      expv[48] = 18'h23111;
      expv[49] = 18'h242f3;
      expv[50] = 18'h1e23a;
      expv[51] = 18'h25707;
      expv[52] = 18'h25707;
      expv[53] = 18'h25707;
      expv[54] = 18'h22c9c;
      expv[55] = 18'h22c9c;
      expv[56] = 18'h32d1b;
      expv[57] = 18'h044a8;
      expv[58] = 18'h040c4;
      expv[59] = 18'h0ae30;
      expv[60] = 18'h210fb;
      expv[61] = 18'h210fb;
      expv[62] = 18'h26e9b;
      expv[63] = 18'h0d721;
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
