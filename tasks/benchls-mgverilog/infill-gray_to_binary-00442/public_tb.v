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

  mg_00442 dut (
    .gray_val(in_vec[7:0]),
    .bin_val(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h85;
    stim[1] = 8'h10;
    stim[2] = 8'hd5;
    stim[3] = 8'hd9;
    stim[4] = 8'hb6;
    stim[5] = 8'h06;
    stim[6] = 8'h17;
    stim[7] = 8'h58;
    stim[8] = 8'hd1;
    stim[9] = 8'h66;
    stim[10] = 8'h25;
    stim[11] = 8'ha1;
    stim[12] = 8'hfb;
    stim[13] = 8'h09;
    stim[14] = 8'ha4;
    stim[15] = 8'hf5;
    stim[16] = 8'ha0;
    stim[17] = 8'h63;
    stim[18] = 8'h88;
    stim[19] = 8'h1e;
    stim[20] = 8'h9f;
    stim[21] = 8'ha3;
    stim[22] = 8'h24;
    stim[23] = 8'hc1;
    stim[24] = 8'h62;
    stim[25] = 8'h3e;
    stim[26] = 8'h5b;
    stim[27] = 8'h23;
    stim[28] = 8'h80;
    stim[29] = 8'h78;
    stim[30] = 8'h70;
    stim[31] = 8'heb;
    stim[32] = 8'h99;
    stim[33] = 8'hb2;
    stim[34] = 8'h35;
    stim[35] = 8'h0b;
    stim[36] = 8'h98;
    stim[37] = 8'hf4;
    stim[38] = 8'h95;
    stim[39] = 8'hfb;
    stim[40] = 8'he7;
    stim[41] = 8'h52;
    stim[42] = 8'h4d;
    stim[43] = 8'hca;
    stim[44] = 8'h7a;
    stim[45] = 8'h77;
    stim[46] = 8'h32;
    stim[47] = 8'h6a;
    stim[48] = 8'h6b;
    stim[49] = 8'h1b;
    stim[50] = 8'hdb;
    stim[51] = 8'h58;
    stim[52] = 8'hd9;
    stim[53] = 8'h77;
    stim[54] = 8'hb3;
    stim[55] = 8'he1;
    stim[56] = 8'h5b;
    stim[57] = 8'ha8;
    stim[58] = 8'hff;
    stim[59] = 8'h0e;
    stim[60] = 8'h89;
    stim[61] = 8'h52;
    stim[62] = 8'h79;
    stim[63] = 8'h27;
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
      expv[0] = 8'hf9;
      expv[1] = 8'h1f;
      expv[2] = 8'h99;
      expv[3] = 8'h91;
      expv[4] = 8'hdb;
      expv[5] = 8'h04;
      expv[6] = 8'h1a;
      expv[7] = 8'h6f;
      expv[8] = 8'h9e;
      expv[9] = 8'h44;
      expv[10] = 8'h39;
      expv[11] = 8'hc1;
      expv[12] = 8'had;
      expv[13] = 8'h0e;
      expv[14] = 8'hc7;
      expv[15] = 8'ha6;
      expv[16] = 8'hc0;
      expv[17] = 8'h42;
      expv[18] = 8'hf0;
      expv[19] = 8'h14;
      expv[20] = 8'hea;
      expv[21] = 8'hc2;
      expv[22] = 8'h38;
      expv[23] = 8'h81;
      expv[24] = 8'h43;
      expv[25] = 8'h2b;
      expv[26] = 8'h6d;
      expv[27] = 8'h3d;
      expv[28] = 8'hff;
      expv[29] = 8'h50;
      expv[30] = 8'h5f;
      expv[31] = 8'hb2;
      expv[32] = 8'hee;
      expv[33] = 8'hdc;
      expv[34] = 8'h26;
      expv[35] = 8'h0d;
      expv[36] = 8'hef;
      expv[37] = 8'ha7;
      expv[38] = 8'he6;
      expv[39] = 8'had;
      expv[40] = 8'hba;
      expv[41] = 8'h63;
      expv[42] = 8'h76;
      expv[43] = 8'h8c;
      expv[44] = 8'h53;
      expv[45] = 8'h5a;
      expv[46] = 8'h23;
      expv[47] = 8'h4c;
      expv[48] = 8'h4d;
      expv[49] = 8'h12;
      expv[50] = 8'h92;
      expv[51] = 8'h6f;
      expv[52] = 8'h91;
      expv[53] = 8'h5a;
      expv[54] = 8'hdd;
      expv[55] = 8'hbe;
      expv[56] = 8'h6d;
      expv[57] = 8'hcf;
      expv[58] = 8'haa;
      expv[59] = 8'h0b;
      expv[60] = 8'hf1;
      expv[61] = 8'h63;
      expv[62] = 8'h51;
      expv[63] = 8'h3a;
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
