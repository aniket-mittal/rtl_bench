// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_076030 dut (
    .update(clk),
    .numero(in_vec[7:0]),
    .unidades(out_vec[15:8]),
    .decenas(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h17;
    stim[1] = 8'h89;
    stim[2] = 8'he5;
    stim[3] = 8'h8d;
    stim[4] = 8'h50;
    stim[5] = 8'h45;
    stim[6] = 8'hcf;
    stim[7] = 8'hf5;
    stim[8] = 8'h57;
    stim[9] = 8'h61;
    stim[10] = 8'h4f;
    stim[11] = 8'h9b;
    stim[12] = 8'hb8;
    stim[13] = 8'h1d;
    stim[14] = 8'h77;
    stim[15] = 8'h0f;
    stim[16] = 8'h4e;
    stim[17] = 8'hfc;
    stim[18] = 8'h92;
    stim[19] = 8'hc6;
    stim[20] = 8'hb8;
    stim[21] = 8'h48;
    stim[22] = 8'hcc;
    stim[23] = 8'h2b;
    stim[24] = 8'h01;
    stim[25] = 8'ha8;
    stim[26] = 8'h7e;
    stim[27] = 8'hb9;
    stim[28] = 8'ha6;
    stim[29] = 8'h66;
    stim[30] = 8'h6e;
    stim[31] = 8'h59;
    stim[32] = 8'hbf;
    stim[33] = 8'h35;
    stim[34] = 8'haf;
    stim[35] = 8'h39;
    stim[36] = 8'h0a;
    stim[37] = 8'hdb;
    stim[38] = 8'h1a;
    stim[39] = 8'h9f;
    stim[40] = 8'h1e;
    stim[41] = 8'h22;
    stim[42] = 8'hf2;
    stim[43] = 8'hb1;
    stim[44] = 8'h2e;
    stim[45] = 8'h6f;
    stim[46] = 8'h7c;
    stim[47] = 8'h40;
    stim[48] = 8'h3d;
    stim[49] = 8'h05;
    stim[50] = 8'h7a;
    stim[51] = 8'h4a;
    stim[52] = 8'h81;
    stim[53] = 8'h92;
    stim[54] = 8'h1c;
    stim[55] = 8'h9e;
    stim[56] = 8'hd9;
    stim[57] = 8'h86;
    stim[58] = 8'h0b;
    stim[59] = 8'h2e;
    stim[60] = 8'h8e;
    stim[61] = 8'h91;
    stim[62] = 8'h33;
    stim[63] = 8'h97;
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
      expv[1] = 16'h0302;
      expv[2] = 16'h2f09;
      expv[3] = 16'h8b09;
      expv[4] = 16'h3309;
      expv[5] = 16'h0008;
      expv[6] = 16'h0906;
      expv[7] = 16'h7509;
      expv[8] = 16'h9b09;
      expv[9] = 16'h0708;
      expv[10] = 16'h0709;
      expv[11] = 16'h0907;
      expv[12] = 16'h4109;
      expv[13] = 16'h5e09;
      expv[14] = 16'h0902;
      expv[15] = 16'h1d09;
      expv[16] = 16'h0501;
      expv[17] = 16'h0807;
      expv[18] = 16'ha209;
      expv[19] = 16'h3809;
      expv[20] = 16'h6c09;
      expv[21] = 16'h5e09;
      expv[22] = 16'h0207;
      expv[23] = 16'h7209;
      expv[24] = 16'h0304;
      expv[25] = 16'h0100;
      expv[26] = 16'h4e09;
      expv[27] = 16'h2409;
      expv[28] = 16'h5f09;
      expv[29] = 16'h4c09;
      expv[30] = 16'h0c09;
      expv[31] = 16'h1409;
      expv[32] = 16'h0908;
      expv[33] = 16'h6509;
      expv[34] = 16'h0305;
      expv[35] = 16'h5509;
      expv[36] = 16'h0705;
      expv[37] = 16'h0001;
      expv[38] = 16'h8109;
      expv[39] = 16'h0602;
      expv[40] = 16'h4509;
      expv[41] = 16'h0003;
      expv[42] = 16'h0403;
      expv[43] = 16'h9809;
      expv[44] = 16'h5709;
      expv[45] = 16'h0604;
      expv[46] = 16'h1509;
      expv[47] = 16'h2209;
      expv[48] = 16'h0406;
      expv[49] = 16'h0106;
      expv[50] = 16'h0500;
      expv[51] = 16'h2009;
      expv[52] = 16'h0407;
      expv[53] = 16'h2709;
      expv[54] = 16'h3809;
      expv[55] = 16'h0802;
      expv[56] = 16'h4409;
      expv[57] = 16'h7f09;
      expv[58] = 16'h2c09;
      expv[59] = 16'h0101;
      expv[60] = 16'h0604;
      expv[61] = 16'h3409;
      expv[62] = 16'h3709;
      expv[63] = 16'h0105;
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
