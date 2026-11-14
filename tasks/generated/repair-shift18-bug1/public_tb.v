// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .load(in_vec[67:67]),
    .ena(in_vec[66:66]),
    .amount(in_vec[65:64]),
    .data(in_vec[63:0]),
    .q(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h78a5dbb42736d7abb;
    stim[1] = 68'h27349913ca9b6cc3c;
    stim[2] = 68'h23678daa4426ed81b;
    stim[3] = 68'hf4e56b351f2fb314e;
    stim[4] = 68'h522023b497627569e;
    stim[5] = 68'h0be14ac4a0f6da1a8;
    stim[6] = 68'h82d4945045598e79a;
    stim[7] = 68'h0deda3bf96827eb15;
    stim[8] = 68'h2eaa5fa8322dc7aa8;
    stim[9] = 68'h535c3aff5a49ee9fa;
    stim[10] = 68'h1c0e823fafc59587f;
    stim[11] = 68'hd8626a6b7f0d05507;
    stim[12] = 68'hee41c0cad724b6592;
    stim[13] = 68'h73904d566b58d7c68;
    stim[14] = 68'h5b847ba0fca210399;
    stim[15] = 68'h68cdcaa1c0320555a;
    stim[16] = 68'hbf3ba6925ca60bb0c;
    stim[17] = 68'h873f0bcb450112c5b;
    stim[18] = 68'h2c600f1e8fa63f032;
    stim[19] = 68'h9ed1819e15f5d45a7;
    stim[20] = 68'h00787a975352fba2c;
    stim[21] = 68'ha3acaa30faa6e01a7;
    stim[22] = 68'h9af0159c64344a9cf;
    stim[23] = 68'h2d2e84abd82cbce88;
    stim[24] = 68'h9f1a5ab301f4728fc;
    stim[25] = 68'h284018a5ce135f49f;
    stim[26] = 68'hd5456a258129f0036;
    stim[27] = 68'hc85da11ef7c00679b;
    stim[28] = 68'hdad5f2966fa67312f;
    stim[29] = 68'hf158c530e1900a84b;
    stim[30] = 68'h9c341613c2c7917ab;
    stim[31] = 68'hd0096edc63a824873;
    stim[32] = 68'h8f9cffb56fb1fe0ee;
    stim[33] = 68'hde4387edcab3ae714;
    stim[34] = 68'he9f5d6ec3c1a295ac;
    stim[35] = 68'h5e1143e339c9cf069;
    stim[36] = 68'hde3fec73547a4e928;
    stim[37] = 68'h09f0630b924afd1ff;
    stim[38] = 68'hb7d519c798fdbc41b;
    stim[39] = 68'ha9385a2dbf234e443;
    stim[40] = 68'h2dec9d4864c731c8f;
    stim[41] = 68'hc34709be13e9c0835;
    stim[42] = 68'h630cfac53f4b7e939;
    stim[43] = 68'h472014da622ffdedd;
    stim[44] = 68'hc39f5631b76c336a5;
    stim[45] = 68'hb7350e14ea9cabb61;
    stim[46] = 68'h77194fde10444bae2;
    stim[47] = 68'heb207a33046a18e7f;
    stim[48] = 68'h909c0bf55781a93e4;
    stim[49] = 68'hdb48e368c8eff4dc8;
    stim[50] = 68'h2949167d755acd82c;
    stim[51] = 68'hd94e5e7cf1a715e4e;
    stim[52] = 68'h2787bf30d1f8a3f4d;
    stim[53] = 68'hfd3df1023b9987ad2;
    stim[54] = 68'h64c7aa75959fc3d45;
    stim[55] = 68'h17fac15498b107ec2;
    stim[56] = 68'h2b8e11c6e9369b2b2;
    stim[57] = 68'hf3dea439b2ef8520a;
    stim[58] = 68'h3fa47762dd9e63afd;
    stim[59] = 68'h7c28c39adc26e92f8;
    stim[60] = 68'h55e35464dcdd936b9;
    stim[61] = 68'h4b23fc41b6adc332a;
    stim[62] = 68'he0f574ffe954d4f08;
    stim[63] = 68'hc1890c254e91493d1;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'h4e56b351f2fb314e;
      expv[5] = 64'h4e56b351f2fb314e;
      expv[6] = 64'h9cad66a3e5f6629c;
      expv[7] = 64'h2d4945045598e79a;
      expv[8] = 64'h5a928a08ab31cf34;
      expv[9] = 64'h2d4945045598e79a;
      expv[10] = 64'h2d4945045598e79a;
      expv[11] = 64'h4945045598e79a00;
      expv[12] = 64'h8626a6b7f0d05507;
      expv[13] = 64'he41c0cad724b6592;
      expv[14] = 64'he41c0cad724b6592;
      expv[15] = 64'he41c0cad724b6592;
      expv[16] = 64'he41c0cad724b6592;
      expv[17] = 64'hf3ba6925ca60bb0c;
      expv[18] = 64'h73f0bcb450112c5b;
      expv[19] = 64'h39f85e5a2808962d;
      expv[20] = 64'hed1819e15f5d45a7;
      expv[21] = 64'hda3033c2beba8b4e;
      expv[22] = 64'h3acaa30faa6e01a7;
      expv[23] = 64'haf0159c64344a9cf;
      expv[24] = 64'hd780ace321a254e7;
      expv[25] = 64'hf1a5ab301f4728fc;
      expv[26] = 64'hf8d2d5980fa3947e;
      expv[27] = 64'h5456a258129f0036;
      expv[28] = 64'h85da11ef7c00679b;
      expv[29] = 64'had5f2966fa67312f;
      expv[30] = 64'h158c530e1900a84b;
      expv[31] = 64'hc341613c2c7917ab;
      expv[32] = 64'h0096edc63a824873;
      expv[33] = 64'hf9cffb56fb1fe0ee;
      expv[34] = 64'he4387edcab3ae714;
      expv[35] = 64'h9f5d6ec3c1a295ac;
      expv[36] = 64'h9f5d6ec3c1a295ac;
      expv[37] = 64'he3fec73547a4e928;
      expv[38] = 64'hc7fd8e6a8f49d250;
      expv[39] = 64'h7d519c798fdbc41b;
      expv[40] = 64'h9385a2dbf234e443;
      expv[41] = 64'hc9c2d16df91a7221;
      expv[42] = 64'h34709be13e9c0835;
      expv[43] = 64'h34709be13e9c0835;
      expv[44] = 64'h34709be13e9c0835;
      expv[45] = 64'h39f5631b76c336a5;
      expv[46] = 64'h7350e14ea9cabb61;
      expv[47] = 64'h7350e14ea9cabb61;
      expv[48] = 64'hb207a33046a18e7f;
      expv[49] = 64'h09c0bf55781a93e4;
      expv[50] = 64'hb48e368c8eff4dc8;
      expv[51] = 64'hda471b46477fa6e4;
      expv[52] = 64'h94e5e7cf1a715e4e;
      expv[53] = 64'hca72f3e78d38af27;
      expv[54] = 64'hd3df1023b9987ad2;
      expv[55] = 64'hd3df1023b9987ad2;
      expv[56] = 64'hdf1023b9987ad200;
      expv[57] = 64'hef8811dccc3d6900;
      expv[58] = 64'h3dea439b2ef8520a;
      expv[59] = 64'h003dea439b2ef852;
      expv[60] = 64'h003dea439b2ef852;
      expv[61] = 64'h003dea439b2ef852;
      expv[62] = 64'h003dea439b2ef852;
      expv[63] = 64'h0f574ffe954d4f08;
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
