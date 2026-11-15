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

  gf_mult_by_09 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h6e;
    stim[1] = 8'h0c;
    stim[2] = 8'h48;
    stim[3] = 8'h9f;
    stim[4] = 8'hfd;
    stim[5] = 8'h4a;
    stim[6] = 8'hc3;
    stim[7] = 8'h37;
    stim[8] = 8'h23;
    stim[9] = 8'h3a;
    stim[10] = 8'hd9;
    stim[11] = 8'h9c;
    stim[12] = 8'hc2;
    stim[13] = 8'h6a;
    stim[14] = 8'h06;
    stim[15] = 8'h4c;
    stim[16] = 8'h49;
    stim[17] = 8'ha9;
    stim[18] = 8'h15;
    stim[19] = 8'hc0;
    stim[20] = 8'h76;
    stim[21] = 8'hb8;
    stim[22] = 8'h74;
    stim[23] = 8'hbf;
    stim[24] = 8'h55;
    stim[25] = 8'hea;
    stim[26] = 8'hf5;
    stim[27] = 8'h39;
    stim[28] = 8'he2;
    stim[29] = 8'hda;
    stim[30] = 8'h55;
    stim[31] = 8'h94;
    stim[32] = 8'h67;
    stim[33] = 8'h2d;
    stim[34] = 8'h0c;
    stim[35] = 8'h40;
    stim[36] = 8'hc4;
    stim[37] = 8'hca;
    stim[38] = 8'he3;
    stim[39] = 8'h61;
    stim[40] = 8'h9a;
    stim[41] = 8'h7a;
    stim[42] = 8'hbc;
    stim[43] = 8'h32;
    stim[44] = 8'h74;
    stim[45] = 8'h12;
    stim[46] = 8'h08;
    stim[47] = 8'h25;
    stim[48] = 8'hbc;
    stim[49] = 8'h8e;
    stim[50] = 8'h98;
    stim[51] = 8'hf4;
    stim[52] = 8'h82;
    stim[53] = 8'h44;
    stim[54] = 8'h21;
    stim[55] = 8'h4e;
    stim[56] = 8'hfe;
    stim[57] = 8'hfb;
    stim[58] = 8'h35;
    stim[59] = 8'h58;
    stim[60] = 8'hf3;
    stim[61] = 8'h94;
    stim[62] = 8'h5c;
    stim[63] = 8'h1a;
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
      expv[0] = 8'h39;
      expv[1] = 8'h6c;
      expv[2] = 8'h32;
      expv[3] = 8'h13;
      expv[4] = 8'h46;
      expv[5] = 8'h20;
      expv[6] = 8'h95;
      expv[7] = 8'h92;
      expv[8] = 8'h26;
      expv[9] = 8'hf7;
      expv[10] = 8'h5f;
      expv[11] = 8'h08;
      expv[12] = 8'h9c;
      expv[13] = 8'h1d;
      expv[14] = 8'h36;
      expv[15] = 8'h16;
      expv[16] = 8'h3b;
      expv[17] = 8'h88;
      expv[18] = 8'hbd;
      expv[19] = 8'h8e;
      expv[20] = 8'he1;
      expv[21] = 8'h11;
      expv[22] = 8'hf3;
      expv[23] = 8'h2e;
      expv[24] = 8'hc7;
      expv[25] = 8'he9;
      expv[26] = 8'h0e;
      expv[27] = 8'hec;
      expv[28] = 8'ha1;
      expv[29] = 8'h44;
      expv[30] = 8'hc7;
      expv[31] = 8'h40;
      expv[32] = 8'h78;
      expv[33] = 8'h58;
      expv[34] = 8'h6c;
      expv[35] = 8'h7a;
      expv[36] = 8'haa;
      expv[37] = 8'hd4;
      expv[38] = 8'ha8;
      expv[39] = 8'h4e;
      expv[40] = 8'h3e;
      expv[41] = 8'h8d;
      expv[42] = 8'h35;
      expv[43] = 8'hbf;
      expv[44] = 8'hf3;
      expv[45] = 8'h82;
      expv[46] = 8'h48;
      expv[47] = 8'h10;
      expv[48] = 8'h35;
      expv[49] = 8'h8a;
      expv[50] = 8'h2c;
      expv[51] = 8'h07;
      expv[52] = 8'he6;
      expv[53] = 8'h5e;
      expv[54] = 8'h34;
      expv[55] = 8'h04;
      expv[56] = 8'h5d;
      expv[57] = 8'h70;
      expv[58] = 8'h80;
      expv[59] = 8'ha2;
      expv[60] = 8'h38;
      expv[61] = 8'h40;
      expv[62] = 8'h86;
      expv[63] = 8'hca;
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
