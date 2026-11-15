// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059426 dut (
    .clk(clk),
    .rst_n(in_vec[18:18]),
    .write_req(in_vec[17:17]),
    .fifo_write_data(in_vec[16:1]),
    .read_req(in_vec[0:0]),
    .fifo_read_data(out_vec[18:3]),
    .left_sig(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h3f146;
    stim[1] = 19'h025f0;
    stim[2] = 19'h621c7;
    stim[3] = 19'h428f6;
    stim[4] = 19'h4f8df;
    stim[5] = 19'h6d891;
    stim[6] = 19'h54824;
    stim[7] = 19'h7fc93;
    stim[8] = 19'h49714;
    stim[9] = 19'h55e17;
    stim[10] = 19'h47a1c;
    stim[11] = 19'h77de4;
    stim[12] = 19'h71221;
    stim[13] = 19'h58872;
    stim[14] = 19'h7589d;
    stim[15] = 19'h7c37e;
    stim[16] = 19'h640a3;
    stim[17] = 19'h5fe9a;
    stim[18] = 19'h78c8e;
    stim[19] = 19'h4e5dc;
    stim[20] = 19'h40b80;
    stim[21] = 19'h4826e;
    stim[22] = 19'h728e2;
    stim[23] = 19'h41c18;
    stim[24] = 19'h470fe;
    stim[25] = 19'h4d536;
    stim[26] = 19'h4954f;
    stim[27] = 19'h7dfd7;
    stim[28] = 19'h7204c;
    stim[29] = 19'h5f279;
    stim[30] = 19'h51f29;
    stim[31] = 19'h6fad5;
    stim[32] = 19'h49605;
    stim[33] = 19'h64a4a;
    stim[34] = 19'h2ab9f;
    stim[35] = 19'h58082;
    stim[36] = 19'h5db97;
    stim[37] = 19'h5b019;
    stim[38] = 19'h632d3;
    stim[39] = 19'h5918f;
    stim[40] = 19'h5af2f;
    stim[41] = 19'h651b0;
    stim[42] = 19'h52539;
    stim[43] = 19'h4ecdf;
    stim[44] = 19'h7c698;
    stim[45] = 19'h659b8;
    stim[46] = 19'h44d9e;
    stim[47] = 19'h7d24c;
    stim[48] = 19'h63a11;
    stim[49] = 19'h5bb29;
    stim[50] = 19'h69e99;
    stim[51] = 19'h50ba4;
    stim[52] = 19'h71555;
    stim[53] = 19'h77fa1;
    stim[54] = 19'h7ae46;
    stim[55] = 19'h433c1;
    stim[56] = 19'h5ea37;
    stim[57] = 19'h56d2c;
    stim[58] = 19'h6a0a3;
    stim[59] = 19'h7fb5f;
    stim[60] = 19'h799f0;
    stim[61] = 19'h5c865;
    stim[62] = 19'h637d1;
    stim[63] = 19'h7fe4c;
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
      expv[0] = 19'h00004;
      expv[1] = 19'h00004;
      expv[2] = 19'h00004;
      expv[3] = 19'h00003;
      expv[4] = 19'h00003;
      expv[5] = 19'h0871c;
      expv[6] = 19'h0871b;
      expv[7] = 19'h0871b;
      expv[8] = 19'h36243;
      expv[9] = 19'h36243;
      expv[10] = 19'h7f24c;
      expv[11] = 19'h7f24c;
      expv[12] = 19'h7f24b;
      expv[13] = 19'h5f793;
      expv[14] = 19'h5f793;
      expv[15] = 19'h44883;
      expv[16] = 19'h44882;
      expv[17] = 19'h56272;
      expv[18] = 19'h56272;
      expv[19] = 19'h56271;
      expv[20] = 19'h56271;
      expv[21] = 19'h56271;
      expv[22] = 19'h56271;
      expv[23] = 19'h56270;
      expv[24] = 19'h56270;
      expv[25] = 19'h56270;
      expv[26] = 19'h56270;
      expv[27] = 19'h70df9;
      expv[28] = 19'h10289;
      expv[29] = 19'h10288;
      expv[30] = 19'h63239;
      expv[31] = 19'h4a38a;
      expv[32] = 19'h77f5a;
      expv[33] = 19'h48133;
      expv[34] = 19'h00004;
      expv[35] = 19'h00004;
      expv[36] = 19'h00004;
      expv[37] = 19'h00004;
      expv[38] = 19'h00004;
      expv[39] = 19'h00003;
      expv[40] = 19'h0cb4c;
      expv[41] = 19'h0cb4c;
      expv[42] = 19'h0cb4b;
      expv[43] = 19'h146c4;
      expv[44] = 19'h146c4;
      expv[45] = 19'h146c3;
      expv[46] = 19'h146c2;
      expv[47] = 19'h146c2;
      expv[48] = 19'h146c1;
      expv[49] = 19'h71a61;
      expv[50] = 19'h166e2;
      expv[51] = 19'h74932;
      expv[52] = 19'h74932;
      expv[53] = 19'h0e842;
      expv[54] = 19'h27a62;
      expv[55] = 19'h27a61;
      expv[56] = 19'h45552;
      expv[57] = 19'h5fe83;
      expv[58] = 19'h5fe83;
      expv[59] = 19'h6b91b;
      expv[60] = 19'h2828b;
      expv[61] = 19'h2828a;
      expv[62] = 19'h7ed7b;
      expv[63] = 19'h667c3;
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
