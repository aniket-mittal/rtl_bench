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

  gf_mult_by_ae dut (
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
    stim[0] = 8'he6;
    stim[1] = 8'h93;
    stim[2] = 8'h3b;
    stim[3] = 8'hc9;
    stim[4] = 8'h6c;
    stim[5] = 8'h5b;
    stim[6] = 8'h90;
    stim[7] = 8'h48;
    stim[8] = 8'h33;
    stim[9] = 8'hf6;
    stim[10] = 8'ha7;
    stim[11] = 8'h4f;
    stim[12] = 8'hc5;
    stim[13] = 8'hc7;
    stim[14] = 8'h6a;
    stim[15] = 8'hc4;
    stim[16] = 8'hf9;
    stim[17] = 8'h63;
    stim[18] = 8'h5a;
    stim[19] = 8'h2d;
    stim[20] = 8'h14;
    stim[21] = 8'h13;
    stim[22] = 8'h84;
    stim[23] = 8'h38;
    stim[24] = 8'h98;
    stim[25] = 8'h58;
    stim[26] = 8'h32;
    stim[27] = 8'h01;
    stim[28] = 8'h3a;
    stim[29] = 8'h9e;
    stim[30] = 8'h5f;
    stim[31] = 8'h72;
    stim[32] = 8'hd9;
    stim[33] = 8'h9c;
    stim[34] = 8'hdb;
    stim[35] = 8'h71;
    stim[36] = 8'h82;
    stim[37] = 8'h5f;
    stim[38] = 8'h6a;
    stim[39] = 8'h77;
    stim[40] = 8'hf8;
    stim[41] = 8'hef;
    stim[42] = 8'h71;
    stim[43] = 8'h69;
    stim[44] = 8'hbe;
    stim[45] = 8'h91;
    stim[46] = 8'hfb;
    stim[47] = 8'h7e;
    stim[48] = 8'h04;
    stim[49] = 8'h3f;
    stim[50] = 8'h9a;
    stim[51] = 8'h68;
    stim[52] = 8'h96;
    stim[53] = 8'h18;
    stim[54] = 8'h4a;
    stim[55] = 8'hc8;
    stim[56] = 8'hd9;
    stim[57] = 8'hc8;
    stim[58] = 8'h56;
    stim[59] = 8'hdc;
    stim[60] = 8'h94;
    stim[61] = 8'he4;
    stim[62] = 8'hec;
    stim[63] = 8'h71;
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
      expv[0] = 8'he2;
      expv[1] = 8'h50;
      expv[2] = 8'ha0;
      expv[3] = 8'hf2;
      expv[4] = 8'h37;
      expv[5] = 8'h0c;
      expv[6] = 8'hbf;
      expv[7] = 8'hd1;
      expv[8] = 8'hb9;
      expv[9] = 8'hd0;
      expv[10] = 8'h84;
      expv[11] = 8'hbc;
      expv[12] = 8'h69;
      expv[13] = 8'h28;
      expv[14] = 8'hf4;
      expv[15] = 8'hc7;
      expv[16] = 8'ha4;
      expv[17] = 8'h43;
      expv[18] = 8'ha2;
      expv[19] = 8'h51;
      expv[20] = 8'hb0;
      expv[21] = 8'hdd;
      expv[22] = 8'h0f;
      expv[23] = 8'h4f;
      expv[24] = 8'ha6;
      expv[25] = 8'he3;
      expv[26] = 8'h17;
      expv[27] = 8'hae;
      expv[28] = 8'h0e;
      expv[29] = 8'h65;
      expv[30] = 8'h8e;
      expv[31] = 8'hdf;
      expv[32] = 8'hc0;
      expv[33] = 8'h24;
      expv[34] = 8'h81;
      expv[35] = 8'h30;
      expv[36] = 8'hcc;
      expv[37] = 8'h8e;
      expv[38] = 8'hf4;
      expv[39] = 8'hf3;
      expv[40] = 8'h0a;
      expv[41] = 8'h55;
      expv[42] = 8'h30;
      expv[43] = 8'h1b;
      expv[44] = 8'h01;
      expv[45] = 8'h11;
      expv[46] = 8'he5;
      expv[47] = 8'h44;
      expv[48] = 8'h82;
      expv[49] = 8'h22;
      expv[50] = 8'he7;
      expv[51] = 8'hb5;
      expv[52] = 8'h7c;
      expv[53] = 8'h2b;
      expv[54] = 8'h90;
      expv[55] = 8'h5c;
      expv[56] = 8'hc0;
      expv[57] = 8'h5c;
      expv[58] = 8'h39;
      expv[59] = 8'hec;
      expv[60] = 8'h3d;
      expv[61] = 8'ha3;
      expv[62] = 8'hba;
      expv[63] = 8'h30;
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
