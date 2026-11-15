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

  gf_mult_by_30 dut (
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
    stim[0] = 8'h47;
    stim[1] = 8'h24;
    stim[2] = 8'h5f;
    stim[3] = 8'h42;
    stim[4] = 8'h67;
    stim[5] = 8'h62;
    stim[6] = 8'h84;
    stim[7] = 8'h9b;
    stim[8] = 8'ha9;
    stim[9] = 8'h5a;
    stim[10] = 8'hd2;
    stim[11] = 8'ha0;
    stim[12] = 8'h81;
    stim[13] = 8'hf5;
    stim[14] = 8'h52;
    stim[15] = 8'h25;
    stim[16] = 8'h39;
    stim[17] = 8'hef;
    stim[18] = 8'ha8;
    stim[19] = 8'h87;
    stim[20] = 8'hb0;
    stim[21] = 8'ha7;
    stim[22] = 8'h1e;
    stim[23] = 8'h8d;
    stim[24] = 8'h31;
    stim[25] = 8'hc0;
    stim[26] = 8'h34;
    stim[27] = 8'hd9;
    stim[28] = 8'h24;
    stim[29] = 8'hbe;
    stim[30] = 8'h03;
    stim[31] = 8'hff;
    stim[32] = 8'h04;
    stim[33] = 8'h1b;
    stim[34] = 8'h11;
    stim[35] = 8'h8b;
    stim[36] = 8'hb3;
    stim[37] = 8'h13;
    stim[38] = 8'h99;
    stim[39] = 8'hb2;
    stim[40] = 8'h45;
    stim[41] = 8'h39;
    stim[42] = 8'h63;
    stim[43] = 8'hfa;
    stim[44] = 8'h27;
    stim[45] = 8'h20;
    stim[46] = 8'h79;
    stim[47] = 8'h7e;
    stim[48] = 8'hdb;
    stim[49] = 8'h8c;
    stim[50] = 8'h61;
    stim[51] = 8'hc2;
    stim[52] = 8'ha4;
    stim[53] = 8'h0f;
    stim[54] = 8'h17;
    stim[55] = 8'hb2;
    stim[56] = 8'h2c;
    stim[57] = 8'h51;
    stim[58] = 8'h58;
    stim[59] = 8'hcd;
    stim[60] = 8'h00;
    stim[61] = 8'hbf;
    stim[62] = 8'hb2;
    stim[63] = 8'hbb;
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
      expv[0] = 8'h0c;
      expv[1] = 8'h8e;
      expv[2] = 8'hb6;
      expv[3] = 8'hfc;
      expv[4] = 8'h42;
      expv[5] = 8'hb2;
      expv[6] = 8'he5;
      expv[7] = 8'hcf;
      expv[8] = 8'hc6;
      expv[9] = 8'h46;
      expv[10] = 8'hfe;
      expv[11] = 8'h6b;
      expv[12] = 8'h15;
      expv[13] = 8'h20;
      expv[14] = 8'hdb;
      expv[15] = 8'hbe;
      expv[16] = 8'hc4;
      expv[17] = 8'hfa;
      expv[18] = 8'hf6;
      expv[19] = 8'hb5;
      expv[20] = 8'h4c;
      expv[21] = 8'hfb;
      expv[22] = 8'h1a;
      expv[23] = 8'h48;
      expv[24] = 8'h59;
      expv[25] = 8'hb9;
      expv[26] = 8'ha9;
      expv[27] = 8'h33;
      expv[28] = 8'h8e;
      expv[29] = 8'h71;
      expv[30] = 8'h50;
      expv[31] = 8'hdd;
      expv[32] = 8'hc0;
      expv[33] = 8'hea;
      expv[34] = 8'h17;
      expv[35] = 8'he8;
      expv[36] = 8'h1c;
      expv[37] = 8'h77;
      expv[38] = 8'haf;
      expv[39] = 8'h2c;
      expv[40] = 8'h6c;
      expv[41] = 8'hc4;
      expv[42] = 8'h82;
      expv[43] = 8'h2d;
      expv[44] = 8'hde;
      expv[45] = 8'h4e;
      expv[46] = 8'h58;
      expv[47] = 8'hc8;
      expv[48] = 8'h53;
      expv[49] = 8'h78;
      expv[50] = 8'he2;
      expv[51] = 8'hd9;
      expv[52] = 8'hab;
      expv[53] = 8'h0d;
      expv[54] = 8'hb7;
      expv[55] = 8'h2c;
      expv[56] = 8'h13;
      expv[57] = 8'h8b;
      expv[58] = 8'h26;
      expv[59] = 8'hd4;
      expv[60] = 8'h00;
      expv[61] = 8'h41;
      expv[62] = 8'h2c;
      expv[63] = 8'h81;
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
