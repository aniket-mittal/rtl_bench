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

  gf_mult_by_14 dut (
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
    stim[0] = 8'h99;
    stim[1] = 8'had;
    stim[2] = 8'h43;
    stim[3] = 8'h34;
    stim[4] = 8'hc8;
    stim[5] = 8'h85;
    stim[6] = 8'h6e;
    stim[7] = 8'h9d;
    stim[8] = 8'hee;
    stim[9] = 8'h91;
    stim[10] = 8'h52;
    stim[11] = 8'h8c;
    stim[12] = 8'h8d;
    stim[13] = 8'h1f;
    stim[14] = 8'h4e;
    stim[15] = 8'h64;
    stim[16] = 8'h58;
    stim[17] = 8'h73;
    stim[18] = 8'he6;
    stim[19] = 8'h13;
    stim[20] = 8'h2f;
    stim[21] = 8'h2c;
    stim[22] = 8'h4c;
    stim[23] = 8'he5;
    stim[24] = 8'ha8;
    stim[25] = 8'hc6;
    stim[26] = 8'hea;
    stim[27] = 8'hcf;
    stim[28] = 8'hb6;
    stim[29] = 8'h37;
    stim[30] = 8'h1c;
    stim[31] = 8'h78;
    stim[32] = 8'h30;
    stim[33] = 8'hb9;
    stim[34] = 8'h72;
    stim[35] = 8'h61;
    stim[36] = 8'h90;
    stim[37] = 8'hf6;
    stim[38] = 8'h54;
    stim[39] = 8'h33;
    stim[40] = 8'hc5;
    stim[41] = 8'hd5;
    stim[42] = 8'h35;
    stim[43] = 8'hdd;
    stim[44] = 8'he2;
    stim[45] = 8'h8e;
    stim[46] = 8'hc9;
    stim[47] = 8'ha5;
    stim[48] = 8'h31;
    stim[49] = 8'h7d;
    stim[50] = 8'hab;
    stim[51] = 8'h6d;
    stim[52] = 8'hcb;
    stim[53] = 8'h4b;
    stim[54] = 8'hbb;
    stim[55] = 8'hbc;
    stim[56] = 8'he0;
    stim[57] = 8'hae;
    stim[58] = 8'hef;
    stim[59] = 8'hf3;
    stim[60] = 8'ha0;
    stim[61] = 8'hba;
    stim[62] = 8'h50;
    stim[63] = 8'he4;
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
      expv[0] = 8'h3b;
      expv[1] = 8'h8c;
      expv[2] = 8'h55;
      expv[3] = 8'hb7;
      expv[4] = 8'h1b;
      expv[5] = 8'h96;
      expv[6] = 8'h0b;
      expv[7] = 8'h6b;
      expv[8] = 8'hd9;
      expv[9] = 8'h9b;
      expv[10] = 8'h1c;
      expv[11] = 8'h22;
      expv[12] = 8'h36;
      expv[13] = 8'h91;
      expv[14] = 8'hb1;
      expv[15] = 8'h83;
      expv[16] = 8'h94;
      expv[17] = 8'hb2;
      expv[18] = 8'h79;
      expv[19] = 8'h61;
      expv[20] = 8'h76;
      expv[21] = 8'h4a;
      expv[22] = 8'h99;
      expv[23] = 8'h45;
      expv[24] = 8'hc8;
      expv[25] = 8'hc3;
      expv[26] = 8'h89;
      expv[27] = 8'h77;
      expv[28] = 8'h4d;
      expv[29] = 8'h8b;
      expv[30] = 8'had;
      expv[31] = 8'h2e;
      expv[32] = 8'he7;
      expv[33] = 8'h81;
      expv[34] = 8'ha6;
      expv[35] = 8'hc7;
      expv[36] = 8'h8f;
      expv[37] = 8'h24;
      expv[38] = 8'h64;
      expv[39] = 8'hdb;
      expv[40] = 8'hff;
      expv[41] = 8'ha2;
      expv[42] = 8'ha3;
      expv[43] = 8'h02;
      expv[44] = 8'h29;
      expv[45] = 8'h0a;
      expv[46] = 8'h0f;
      expv[47] = 8'h2c;
      expv[48] = 8'hf3;
      expv[49] = 8'h6a;
      expv[50] = 8'hf4;
      expv[51] = 8'h37;
      expv[52] = 8'h27;
      expv[53] = 8'hf5;
      expv[54] = 8'ha9;
      expv[55] = 8'hc5;
      expv[56] = 8'h01;
      expv[57] = 8'hb0;
      expv[58] = 8'hcd;
      expv[59] = 8'h60;
      expv[60] = 8'h68;
      expv[61] = 8'hbd;
      expv[62] = 8'h34;
      expv[63] = 8'h51;
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
