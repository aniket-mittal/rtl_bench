// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104424 dut (
    .clock(clk),
    .io_d(in_vec[42:0]),
    .io_q(out_vec[42:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h55d45a8a136;
    stim[1] = 43'h403f4628566;
    stim[2] = 43'h21aee6bfc6a;
    stim[3] = 43'h269fd9fb8f7;
    stim[4] = 43'h280bf8275a8;
    stim[5] = 43'h3f8975da837;
    stim[6] = 43'h6107315fd98;
    stim[7] = 43'h6ccf0c3f5b5;
    stim[8] = 43'h5a49adde242;
    stim[9] = 43'h790bdb3777f;
    stim[10] = 43'h1400982c79d;
    stim[11] = 43'h3348edc6187;
    stim[12] = 43'h2f1c921c297;
    stim[13] = 43'h60ec500f08d;
    stim[14] = 43'h715c3705974;
    stim[15] = 43'h572ffabceff;
    stim[16] = 43'h4e96d535749;
    stim[17] = 43'h00605a62e78;
    stim[18] = 43'h5788d303b76;
    stim[19] = 43'h33df294bae7;
    stim[20] = 43'h67202b472e3;
    stim[21] = 43'h68641f396fc;
    stim[22] = 43'h1720d43e8c1;
    stim[23] = 43'h6690f79c3ee;
    stim[24] = 43'h3b2f3e72794;
    stim[25] = 43'h594cb9973b4;
    stim[26] = 43'h7f48b9fa735;
    stim[27] = 43'h4eeec594175;
    stim[28] = 43'h59d51ff937c;
    stim[29] = 43'h57dfc1802a3;
    stim[30] = 43'h6687ee82366;
    stim[31] = 43'h26cc55f9a7f;
    stim[32] = 43'h0b5a520721b;
    stim[33] = 43'h4d75091455f;
    stim[34] = 43'h3a4883c02b1;
    stim[35] = 43'h4b524e5e6ab;
    stim[36] = 43'h2dd189a4be2;
    stim[37] = 43'h1f22bdcace9;
    stim[38] = 43'h672f5ca5be2;
    stim[39] = 43'h5c95379a84a;
    stim[40] = 43'h0265c518090;
    stim[41] = 43'h531084fa9b9;
    stim[42] = 43'h217764202ef;
    stim[43] = 43'h508312c2a38;
    stim[44] = 43'h37bd69736bf;
    stim[45] = 43'h4130ee2818a;
    stim[46] = 43'h30dd23b5d36;
    stim[47] = 43'h26b33f700c5;
    stim[48] = 43'h4d3a3b7dc3d;
    stim[49] = 43'h09371ddb80a;
    stim[50] = 43'h059aa68e0a2;
    stim[51] = 43'h59618d3497e;
    stim[52] = 43'h693bab925f1;
    stim[53] = 43'h607a9b14e71;
    stim[54] = 43'h7782525cdd9;
    stim[55] = 43'h16b6b948e0e;
    stim[56] = 43'h7d22da3db41;
    stim[57] = 43'h47211c77c63;
    stim[58] = 43'h10e69ac80a9;
    stim[59] = 43'h05046e271cb;
    stim[60] = 43'h6fd7717ca39;
    stim[61] = 43'h39bf260d80f;
    stim[62] = 43'h44c8a2e455b;
    stim[63] = 43'h5142df1761d;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h55d45a8a136;
      expv[2] = 43'h403f4628566;
      expv[3] = 43'h21aee6bfc6a;
      expv[4] = 43'h269fd9fb8f7;
      expv[5] = 43'h280bf8275a8;
      expv[6] = 43'h3f8975da837;
      expv[7] = 43'h6107315fd98;
      expv[8] = 43'h6ccf0c3f5b5;
      expv[9] = 43'h5a49adde242;
      expv[10] = 43'h790bdb3777f;
      expv[11] = 43'h1400982c79d;
      expv[12] = 43'h3348edc6187;
      expv[13] = 43'h2f1c921c297;
      expv[14] = 43'h60ec500f08d;
      expv[15] = 43'h715c3705974;
      expv[16] = 43'h572ffabceff;
      expv[17] = 43'h4e96d535749;
      expv[18] = 43'h00605a62e78;
      expv[19] = 43'h5788d303b76;
      expv[20] = 43'h33df294bae7;
      expv[21] = 43'h67202b472e3;
      expv[22] = 43'h68641f396fc;
      expv[23] = 43'h1720d43e8c1;
      expv[24] = 43'h6690f79c3ee;
      expv[25] = 43'h3b2f3e72794;
      expv[26] = 43'h594cb9973b4;
      expv[27] = 43'h7f48b9fa735;
      expv[28] = 43'h4eeec594175;
      expv[29] = 43'h59d51ff937c;
      expv[30] = 43'h57dfc1802a3;
      expv[31] = 43'h6687ee82366;
      expv[32] = 43'h26cc55f9a7f;
      expv[33] = 43'h0b5a520721b;
      expv[34] = 43'h4d75091455f;
      expv[35] = 43'h3a4883c02b1;
      expv[36] = 43'h4b524e5e6ab;
      expv[37] = 43'h2dd189a4be2;
      expv[38] = 43'h1f22bdcace9;
      expv[39] = 43'h672f5ca5be2;
      expv[40] = 43'h5c95379a84a;
      expv[41] = 43'h0265c518090;
      expv[42] = 43'h531084fa9b9;
      expv[43] = 43'h217764202ef;
      expv[44] = 43'h508312c2a38;
      expv[45] = 43'h37bd69736bf;
      expv[46] = 43'h4130ee2818a;
      expv[47] = 43'h30dd23b5d36;
      expv[48] = 43'h26b33f700c5;
      expv[49] = 43'h4d3a3b7dc3d;
      expv[50] = 43'h09371ddb80a;
      expv[51] = 43'h059aa68e0a2;
      expv[52] = 43'h59618d3497e;
      expv[53] = 43'h693bab925f1;
      expv[54] = 43'h607a9b14e71;
      expv[55] = 43'h7782525cdd9;
      expv[56] = 43'h16b6b948e0e;
      expv[57] = 43'h7d22da3db41;
      expv[58] = 43'h47211c77c63;
      expv[59] = 43'h10e69ac80a9;
      expv[60] = 43'h05046e271cb;
      expv[61] = 43'h6fd7717ca39;
      expv[62] = 43'h39bf260d80f;
      expv[63] = 43'h44c8a2e455b;
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
