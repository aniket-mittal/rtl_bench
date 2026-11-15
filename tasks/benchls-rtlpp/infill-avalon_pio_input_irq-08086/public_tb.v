// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08086 dut (
    .clk(clk),
    .address(in_vec[39:38]),
    .chipselect(in_vec[37:37]),
    .in_port(in_vec[36:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hacc884d3d9;
    stim[1] = 40'he98ee660d7;
    stim[2] = 40'hf3da534f8d;
    stim[3] = 40'h4fe6d86aa7;
    stim[4] = 40'h4e39f0a000;
    stim[5] = 40'h7fdd87921f;
    stim[6] = 40'h02b76d7418;
    stim[7] = 40'h7231c2a1cc;
    stim[8] = 40'h0313790038;
    stim[9] = 40'h9288f64638;
    stim[10] = 40'h27001abdd1;
    stim[11] = 40'h306f6cf6f8;
    stim[12] = 40'h324084e64d;
    stim[13] = 40'hfb3e66da57;
    stim[14] = 40'he6156bdc09;
    stim[15] = 40'hcf292eda98;
    stim[16] = 40'ha3fef6dc90;
    stim[17] = 40'hafec7af83e;
    stim[18] = 40'ha60e9dd7fd;
    stim[19] = 40'hf35e127e67;
    stim[20] = 40'h6e8b91cf60;
    stim[21] = 40'hd6973320a0;
    stim[22] = 40'h5b163fda1e;
    stim[23] = 40'heb2aed165c;
    stim[24] = 40'h27d6a4b0e5;
    stim[25] = 40'h4326393788;
    stim[26] = 40'h8761351e5c;
    stim[27] = 40'he310f1a018;
    stim[28] = 40'h66943eadb8;
    stim[29] = 40'h72520ebeea;
    stim[30] = 40'h4697a2d54d;
    stim[31] = 40'h02e7988a21;
    stim[32] = 40'hdf4375cf9e;
    stim[33] = 40'h1ac1971d5b;
    stim[34] = 40'hef9d7db1dc;
    stim[35] = 40'h43a98c8ca6;
    stim[36] = 40'hdf341820a0;
    stim[37] = 40'hed651c98d6;
    stim[38] = 40'he39ec5d475;
    stim[39] = 40'h3f815d66a8;
    stim[40] = 40'h5619667d9a;
    stim[41] = 40'hc513938209;
    stim[42] = 40'hdebb4946de;
    stim[43] = 40'h5afe6df2cf;
    stim[44] = 40'h2ebc572984;
    stim[45] = 40'h833ca90102;
    stim[46] = 40'h7f981db4af;
    stim[47] = 40'hafcd8908cf;
    stim[48] = 40'he7062bc6ec;
    stim[49] = 40'hab4c771eb7;
    stim[50] = 40'h1af1e87e35;
    stim[51] = 40'h1681365fdb;
    stim[52] = 40'h8b95762534;
    stim[53] = 40'h4bf41e1385;
    stim[54] = 40'h32a2ac4524;
    stim[55] = 40'h467ceea3c4;
    stim[56] = 40'ha7db3a914b;
    stim[57] = 40'hffd3a6e5a9;
    stim[58] = 40'h9e92f7eb57;
    stim[59] = 40'h5377f75c15;
    stim[60] = 40'h160414ddfa;
    stim[61] = 40'hd76acc8375;
    stim[62] = 40'h6610c5cdeb;
    stim[63] = 40'h86bdc3d7c8;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000004;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000004;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h100000000;
      expv[20] = 33'h100000003;
      expv[21] = 33'h100000000;
      expv[22] = 33'h100000007;
      expv[23] = 33'h100000000;
      expv[24] = 33'h100000007;
      expv[25] = 33'h100000001;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000005;
      expv[28] = 33'h100000007;
      expv[29] = 33'h100000000;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000000;
      expv[33] = 33'h100000007;
      expv[34] = 33'h100000006;
      expv[35] = 33'h100000007;
      expv[36] = 33'h100000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000007;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000003;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000007;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000006;
      expv[52] = 33'h000000005;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000004;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000007;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000005;
      expv[62] = 33'h000000007;
      expv[63] = 33'h000000000;
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
