// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_045147 dut (
    .A(in_vec[7:4]),
    .B(in_vec[3:0]),
    .product(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h63;
    stim[1] = 8'h84;
    stim[2] = 8'ha7;
    stim[3] = 8'h24;
    stim[4] = 8'h69;
    stim[5] = 8'hc3;
    stim[6] = 8'h0e;
    stim[7] = 8'hfd;
    stim[8] = 8'hf7;
    stim[9] = 8'hea;
    stim[10] = 8'h56;
    stim[11] = 8'h34;
    stim[12] = 8'h4a;
    stim[13] = 8'h5c;
    stim[14] = 8'hf1;
    stim[15] = 8'h0b;
    stim[16] = 8'h37;
    stim[17] = 8'hf5;
    stim[18] = 8'h5a;
    stim[19] = 8'h17;
    stim[20] = 8'hae;
    stim[21] = 8'h29;
    stim[22] = 8'hd4;
    stim[23] = 8'h1f;
    stim[24] = 8'hd0;
    stim[25] = 8'h89;
    stim[26] = 8'h89;
    stim[27] = 8'h5b;
    stim[28] = 8'he6;
    stim[29] = 8'hf9;
    stim[30] = 8'h62;
    stim[31] = 8'hc1;
    stim[32] = 8'h42;
    stim[33] = 8'h62;
    stim[34] = 8'hca;
    stim[35] = 8'hf6;
    stim[36] = 8'h80;
    stim[37] = 8'h0b;
    stim[38] = 8'h22;
    stim[39] = 8'h62;
    stim[40] = 8'h28;
    stim[41] = 8'h1b;
    stim[42] = 8'h50;
    stim[43] = 8'h71;
    stim[44] = 8'h0a;
    stim[45] = 8'hb0;
    stim[46] = 8'he2;
    stim[47] = 8'haa;
    stim[48] = 8'h3f;
    stim[49] = 8'hfa;
    stim[50] = 8'hca;
    stim[51] = 8'hbb;
    stim[52] = 8'ha1;
    stim[53] = 8'hdd;
    stim[54] = 8'h80;
    stim[55] = 8'h21;
    stim[56] = 8'h53;
    stim[57] = 8'h72;
    stim[58] = 8'ha8;
    stim[59] = 8'h09;
    stim[60] = 8'h16;
    stim[61] = 8'h17;
    stim[62] = 8'hcf;
    stim[63] = 8'h28;
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
      expv[0] = 8'h12;
      expv[1] = 8'h20;
      expv[2] = 8'h46;
      expv[3] = 8'h08;
      expv[4] = 8'h36;
      expv[5] = 8'h24;
      expv[6] = 8'h00;
      expv[7] = 8'hc3;
      expv[8] = 8'h69;
      expv[9] = 8'h8c;
      expv[10] = 8'h1e;
      expv[11] = 8'h0c;
      expv[12] = 8'h28;
      expv[13] = 8'h3c;
      expv[14] = 8'h0f;
      expv[15] = 8'h00;
      expv[16] = 8'h15;
      expv[17] = 8'h4b;
      expv[18] = 8'h32;
      expv[19] = 8'h07;
      expv[20] = 8'h8c;
      expv[21] = 8'h12;
      expv[22] = 8'h34;
      expv[23] = 8'h0f;
      expv[24] = 8'h00;
      expv[25] = 8'h48;
      expv[26] = 8'h48;
      expv[27] = 8'h37;
      expv[28] = 8'h54;
      expv[29] = 8'h87;
      expv[30] = 8'h0c;
      expv[31] = 8'h0c;
      expv[32] = 8'h08;
      expv[33] = 8'h0c;
      expv[34] = 8'h78;
      expv[35] = 8'h5a;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h04;
      expv[39] = 8'h0c;
      expv[40] = 8'h10;
      expv[41] = 8'h0b;
      expv[42] = 8'h00;
      expv[43] = 8'h07;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h1c;
      expv[47] = 8'h64;
      expv[48] = 8'h2d;
      expv[49] = 8'h96;
      expv[50] = 8'h78;
      expv[51] = 8'h79;
      expv[52] = 8'h0a;
      expv[53] = 8'ha9;
      expv[54] = 8'h00;
      expv[55] = 8'h02;
      expv[56] = 8'h0f;
      expv[57] = 8'h0e;
      expv[58] = 8'h50;
      expv[59] = 8'h00;
      expv[60] = 8'h06;
      expv[61] = 8'h07;
      expv[62] = 8'hb4;
      expv[63] = 8'h10;
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
