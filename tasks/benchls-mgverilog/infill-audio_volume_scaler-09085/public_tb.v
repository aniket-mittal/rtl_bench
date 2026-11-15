// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09085 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .sample(in_vec[17:17]),
    .volume(in_vec[16:14]),
    .pre(in_vec[13:0]),
    .post(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h634e3;
    stim[1] = 19'h77c5b;
    stim[2] = 19'h3e3c3;
    stim[3] = 19'h332d9;
    stim[4] = 19'h27403;
    stim[5] = 19'h38663;
    stim[6] = 19'h2d009;
    stim[7] = 19'h0cd73;
    stim[8] = 19'h230aa;
    stim[9] = 19'h0ea2b;
    stim[10] = 19'h34f6d;
    stim[11] = 19'h16561;
    stim[12] = 19'h0a37c;
    stim[13] = 19'h373e3;
    stim[14] = 19'h3af4f;
    stim[15] = 19'h20b3e;
    stim[16] = 19'h36163;
    stim[17] = 19'h2cfb4;
    stim[18] = 19'h3d3c3;
    stim[19] = 19'h1f1fd;
    stim[20] = 19'h0c43b;
    stim[21] = 19'h00863;
    stim[22] = 19'h3b825;
    stim[23] = 19'h34840;
    stim[24] = 19'h02dbe;
    stim[25] = 19'h28257;
    stim[26] = 19'h2948f;
    stim[27] = 19'h7ec2f;
    stim[28] = 19'h26b45;
    stim[29] = 19'h33c94;
    stim[30] = 19'h33965;
    stim[31] = 19'h1d6d8;
    stim[32] = 19'h1e3d3;
    stim[33] = 19'h0a689;
    stim[34] = 19'h1f2ef;
    stim[35] = 19'h0365b;
    stim[36] = 19'h3ffeb;
    stim[37] = 19'h04cd4;
    stim[38] = 19'h0b267;
    stim[39] = 19'h31b1b;
    stim[40] = 19'h19eec;
    stim[41] = 19'h1bce2;
    stim[42] = 19'h11c4a;
    stim[43] = 19'h32e55;
    stim[44] = 19'h222a2;
    stim[45] = 19'h1adca;
    stim[46] = 19'h39270;
    stim[47] = 19'h1bde5;
    stim[48] = 19'h20277;
    stim[49] = 19'h09fcc;
    stim[50] = 19'h3eb1a;
    stim[51] = 19'h0aa84;
    stim[52] = 19'h00578;
    stim[53] = 19'h2065a;
    stim[54] = 19'h2cdb8;
    stim[55] = 19'h01025;
    stim[56] = 19'h3e4f2;
    stim[57] = 19'h0dde8;
    stim[58] = 19'h13535;
    stim[59] = 19'h3a9ce;
    stim[60] = 19'h2a00f;
    stim[61] = 19'h0baec;
    stim[62] = 19'h174b0;
    stim[63] = 19'h10505;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h8000;
      expv[4] = 16'hb116;
      expv[5] = 16'he806;
      expv[6] = 16'h4ca4;
      expv[7] = 16'h4024;
      expv[8] = 16'h4024;
      expv[9] = 16'hf0aa;
      expv[10] = 16'hf0aa;
      expv[11] = 16'h7b68;
      expv[12] = 16'h7b68;
      expv[13] = 16'h7b68;
      expv[14] = 16'h9f18;
      expv[15] = 16'h8000;
      expv[16] = 16'h0b3e;
      expv[17] = 16'h8000;
      expv[18] = 16'h3ed0;
      expv[19] = 16'h7fff;
      expv[20] = 16'h7fff;
      expv[21] = 16'h7fff;
      expv[22] = 16'h7fff;
      expv[23] = 16'ha1bc;
      expv[24] = 16'h4200;
      expv[25] = 16'h4200;
      expv[26] = 16'h095c;
      expv[27] = 16'h523c;
      expv[28] = 16'h0000;
      expv[29] = 16'hd68a;
      expv[30] = 16'heb78;
      expv[31] = 16'hd85e;
      expv[32] = 16'hd85e;
      expv[33] = 16'hd85e;
      expv[34] = 16'hd85e;
      expv[35] = 16'hd85e;
      expv[36] = 16'hd85e;
      expv[37] = 16'hfeb0;
      expv[38] = 16'hfeb0;
      expv[39] = 16'hfeb0;
      expv[40] = 16'h7fff;
      expv[41] = 16'h7fff;
      expv[42] = 16'h7fff;
      expv[43] = 16'h7fff;
      expv[44] = 16'h95fe;
      expv[45] = 16'he2a2;
      expv[46] = 16'he2a2;
      expv[47] = 16'h7fff;
      expv[48] = 16'h7fff;
      expv[49] = 16'h0277;
      expv[50] = 16'h0277;
      expv[51] = 16'h8000;
      expv[52] = 16'h8000;
      expv[53] = 16'h8000;
      expv[54] = 16'h065a;
      expv[55] = 16'h36e0;
      expv[56] = 16'h36e0;
      expv[57] = 16'h8000;
      expv[58] = 16'h8000;
      expv[59] = 16'h8000;
      expv[60] = 16'h8000;
      expv[61] = 16'h803c;
      expv[62] = 16'h803c;
      expv[63] = 16'h803c;
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
