// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  Emodule dut (
    .A(in_vec[11:8]),
    .B(in_vec[7:4]),
    .S(in_vec[3:0]),
    .E(out_vec[7:4]),
    .Bb(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h533;
    stim[1] = 12'h99f;
    stim[2] = 12'he2a;
    stim[3] = 12'hde4;
    stim[4] = 12'h545;
    stim[5] = 12'h6c7;
    stim[6] = 12'h2dc;
    stim[7] = 12'h2fc;
    stim[8] = 12'h836;
    stim[9] = 12'h28d;
    stim[10] = 12'h01d;
    stim[11] = 12'h56b;
    stim[12] = 12'h3d5;
    stim[13] = 12'h5a0;
    stim[14] = 12'hf64;
    stim[15] = 12'h507;
    stim[16] = 12'h74a;
    stim[17] = 12'h219;
    stim[18] = 12'haba;
    stim[19] = 12'h53f;
    stim[20] = 12'h3c8;
    stim[21] = 12'h49e;
    stim[22] = 12'h1bc;
    stim[23] = 12'h103;
    stim[24] = 12'h0da;
    stim[25] = 12'h0bf;
    stim[26] = 12'hc05;
    stim[27] = 12'h864;
    stim[28] = 12'hf40;
    stim[29] = 12'hb3a;
    stim[30] = 12'h054;
    stim[31] = 12'ha44;
    stim[32] = 12'h381;
    stim[33] = 12'hca3;
    stim[34] = 12'h286;
    stim[35] = 12'h4ce;
    stim[36] = 12'h789;
    stim[37] = 12'h27f;
    stim[38] = 12'h021;
    stim[39] = 12'h0db;
    stim[40] = 12'h6d4;
    stim[41] = 12'h7b7;
    stim[42] = 12'h8a9;
    stim[43] = 12'h67a;
    stim[44] = 12'h5b6;
    stim[45] = 12'h69f;
    stim[46] = 12'h436;
    stim[47] = 12'h415;
    stim[48] = 12'h230;
    stim[49] = 12'h701;
    stim[50] = 12'h101;
    stim[51] = 12'hfe9;
    stim[52] = 12'h391;
    stim[53] = 12'h1ca;
    stim[54] = 12'h3fd;
    stim[55] = 12'he27;
    stim[56] = 12'h81d;
    stim[57] = 12'h96f;
    stim[58] = 12'ha48;
    stim[59] = 12'h5cf;
    stim[60] = 12'h1fd;
    stim[61] = 12'h235;
    stim[62] = 12'h24b;
    stim[63] = 12'h86a;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'hfc;
      expv[1] = 8'h66;
      expv[2] = 8'hdd;
      expv[3] = 8'he1;
      expv[4] = 8'heb;
      expv[5] = 8'hd3;
      expv[6] = 8'hd2;
      expv[7] = 8'hd0;
      expv[8] = 8'h7c;
      expv[9] = 8'hd7;
      expv[10] = 8'hfe;
      expv[11] = 8'hb9;
      expv[12] = 8'hd2;
      expv[13] = 8'hf5;
      expv[14] = 8'h69;
      expv[15] = 8'haf;
      expv[16] = 8'hbb;
      expv[17] = 8'hfe;
      expv[18] = 8'h54;
      expv[19] = 8'hac;
      expv[20] = 8'hf3;
      expv[21] = 8'hb6;
      expv[22] = 8'he4;
      expv[23] = 8'hff;
      expv[24] = 8'hf2;
      expv[25] = 8'hf4;
      expv[26] = 8'h3f;
      expv[27] = 8'h79;
      expv[28] = 8'hfb;
      expv[29] = 8'hcc;
      expv[30] = 8'hfa;
      expv[31] = 8'h5b;
      expv[32] = 8'hf7;
      expv[33] = 8'hf5;
      expv[34] = 8'hd7;
      expv[35] = 8'hb3;
      expv[36] = 8'hf7;
      expv[37] = 8'hd8;
      expv[38] = 8'hfd;
      expv[39] = 8'hf2;
      expv[40] = 8'hd2;
      expv[41] = 8'hb4;
      expv[42] = 8'h75;
      expv[43] = 8'h98;
      expv[44] = 8'hb4;
      expv[45] = 8'h96;
      expv[46] = 8'hbc;
      expv[47] = 8'hbe;
      expv[48] = 8'hfc;
      expv[49] = 8'hff;
      expv[50] = 8'hff;
      expv[51] = 8'h11;
      expv[52] = 8'hf6;
      expv[53] = 8'hf3;
      expv[54] = 8'hc0;
      expv[55] = 8'h3d;
      expv[56] = 8'h7e;
      expv[57] = 8'h69;
      expv[58] = 8'hfb;
      expv[59] = 8'ha3;
      expv[60] = 8'he0;
      expv[61] = 8'hfc;
      expv[62] = 8'hfb;
      expv[63] = 8'hf9;
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
