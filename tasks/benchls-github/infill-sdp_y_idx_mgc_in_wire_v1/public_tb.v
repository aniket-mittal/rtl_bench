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

  SDP_Y_IDX_mgc_in_wire_v1 dut (
    .z(in_vec[7:0]),
    .d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h34;
    stim[1] = 8'ha0;
    stim[2] = 8'hdd;
    stim[3] = 8'h1e;
    stim[4] = 8'h45;
    stim[5] = 8'h00;
    stim[6] = 8'h2c;
    stim[7] = 8'h52;
    stim[8] = 8'he4;
    stim[9] = 8'hef;
    stim[10] = 8'h48;
    stim[11] = 8'hed;
    stim[12] = 8'h07;
    stim[13] = 8'h57;
    stim[14] = 8'hdc;
    stim[15] = 8'hf6;
    stim[16] = 8'h7e;
    stim[17] = 8'h19;
    stim[18] = 8'h97;
    stim[19] = 8'hf6;
    stim[20] = 8'he5;
    stim[21] = 8'hc4;
    stim[22] = 8'hfb;
    stim[23] = 8'h66;
    stim[24] = 8'h5c;
    stim[25] = 8'h8d;
    stim[26] = 8'h78;
    stim[27] = 8'h71;
    stim[28] = 8'h7f;
    stim[29] = 8'h43;
    stim[30] = 8'h9e;
    stim[31] = 8'h37;
    stim[32] = 8'h52;
    stim[33] = 8'h14;
    stim[34] = 8'h08;
    stim[35] = 8'h81;
    stim[36] = 8'he0;
    stim[37] = 8'he5;
    stim[38] = 8'h01;
    stim[39] = 8'h2b;
    stim[40] = 8'hd4;
    stim[41] = 8'h1a;
    stim[42] = 8'h7b;
    stim[43] = 8'h3c;
    stim[44] = 8'h3b;
    stim[45] = 8'h23;
    stim[46] = 8'h58;
    stim[47] = 8'h07;
    stim[48] = 8'hf4;
    stim[49] = 8'h2f;
    stim[50] = 8'he9;
    stim[51] = 8'h28;
    stim[52] = 8'hdd;
    stim[53] = 8'hec;
    stim[54] = 8'hc2;
    stim[55] = 8'h1a;
    stim[56] = 8'h4e;
    stim[57] = 8'h12;
    stim[58] = 8'hbb;
    stim[59] = 8'h95;
    stim[60] = 8'h86;
    stim[61] = 8'h68;
    stim[62] = 8'h43;
    stim[63] = 8'h41;
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
      expv[0] = 8'h34;
      expv[1] = 8'ha0;
      expv[2] = 8'hdd;
      expv[3] = 8'h1e;
      expv[4] = 8'h45;
      expv[5] = 8'h00;
      expv[6] = 8'h2c;
      expv[7] = 8'h52;
      expv[8] = 8'he4;
      expv[9] = 8'hef;
      expv[10] = 8'h48;
      expv[11] = 8'hed;
      expv[12] = 8'h07;
      expv[13] = 8'h57;
      expv[14] = 8'hdc;
      expv[15] = 8'hf6;
      expv[16] = 8'h7e;
      expv[17] = 8'h19;
      expv[18] = 8'h97;
      expv[19] = 8'hf6;
      expv[20] = 8'he5;
      expv[21] = 8'hc4;
      expv[22] = 8'hfb;
      expv[23] = 8'h66;
      expv[24] = 8'h5c;
      expv[25] = 8'h8d;
      expv[26] = 8'h78;
      expv[27] = 8'h71;
      expv[28] = 8'h7f;
      expv[29] = 8'h43;
      expv[30] = 8'h9e;
      expv[31] = 8'h37;
      expv[32] = 8'h52;
      expv[33] = 8'h14;
      expv[34] = 8'h08;
      expv[35] = 8'h81;
      expv[36] = 8'he0;
      expv[37] = 8'he5;
      expv[38] = 8'h01;
      expv[39] = 8'h2b;
      expv[40] = 8'hd4;
      expv[41] = 8'h1a;
      expv[42] = 8'h7b;
      expv[43] = 8'h3c;
      expv[44] = 8'h3b;
      expv[45] = 8'h23;
      expv[46] = 8'h58;
      expv[47] = 8'h07;
      expv[48] = 8'hf4;
      expv[49] = 8'h2f;
      expv[50] = 8'he9;
      expv[51] = 8'h28;
      expv[52] = 8'hdd;
      expv[53] = 8'hec;
      expv[54] = 8'hc2;
      expv[55] = 8'h1a;
      expv[56] = 8'h4e;
      expv[57] = 8'h12;
      expv[58] = 8'hbb;
      expv[59] = 8'h95;
      expv[60] = 8'h86;
      expv[61] = 8'h68;
      expv[62] = 8'h43;
      expv[63] = 8'h41;
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
