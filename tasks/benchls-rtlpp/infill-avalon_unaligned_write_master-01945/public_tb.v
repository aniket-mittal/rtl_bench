// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01945 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h2459500693c17b3e93;
    stim[1] = 70'h326bb30f9219cafd4f;
    stim[2] = 70'h1aafcca61bbf1490c4;
    stim[3] = 70'h18aee7df4b01256319;
    stim[4] = 70'h0ea8f19cfb73e13d31;
    stim[5] = 70'h1f6f78cad89158e746;
    stim[6] = 70'h0a1a894c6e2d18254b;
    stim[7] = 70'h1e40bd67ebb2ff4c13;
    stim[8] = 70'h068d6b9c8c7fd20718;
    stim[9] = 70'h124f0f935cf5ebd377;
    stim[10] = 70'h126c9f785c5995277e;
    stim[11] = 70'h19c0249f22e4188188;
    stim[12] = 70'h0dd50061d84f47f961;
    stim[13] = 70'h0d34d4006efaa4ae27;
    stim[14] = 70'h15131f55d1bc9ef2b1;
    stim[15] = 70'h07a1cd293e53c7383a;
    stim[16] = 70'h14f3eae942b21bbbda;
    stim[17] = 70'h0418fb2b02751fb6bc;
    stim[18] = 70'h0b15eb26056ec70248;
    stim[19] = 70'h107e43b312babfbd17;
    stim[20] = 70'h1be58080d13cec776b;
    stim[21] = 70'h06e44ce57e1d9c9c6f;
    stim[22] = 70'h104829fbae0c46c872;
    stim[23] = 70'h1b3ba288e4524c013f;
    stim[24] = 70'h05469f251b9962d767;
    stim[25] = 70'h1df43aab4d1f3cca5b;
    stim[26] = 70'h07b14dc08a4af8f30e;
    stim[27] = 70'h02823a4cae9e390852;
    stim[28] = 70'h0b2f9535ad380a5a5e;
    stim[29] = 70'h00f0700cb626bff6fa;
    stim[30] = 70'h02ae7c86808c97333b;
    stim[31] = 70'h09382acdfc5e88b9f0;
    stim[32] = 70'h00171cf15c1507a35a;
    stim[33] = 70'h115c431e0d83f53266;
    stim[34] = 70'h14b47bfd630862c19b;
    stim[35] = 70'h0db5799f11b3e015cb;
    stim[36] = 70'h10b9ea723c885beec2;
    stim[37] = 70'h0a449fdce9b79a097f;
    stim[38] = 70'h0c306f2cbdda9e61b1;
    stim[39] = 70'h1e3b1b55ebfc35a17a;
    stim[40] = 70'h1b1556ee5916aa4fb3;
    stim[41] = 70'h07d211a37f8fba1715;
    stim[42] = 70'h0ec6eec1406ffc01d0;
    stim[43] = 70'h179d7c124d3794c129;
    stim[44] = 70'h1b6113661390322c06;
    stim[45] = 70'h0dd12ea8e0b224ef23;
    stim[46] = 70'h0d5a6e08f43a275e1a;
    stim[47] = 70'h000e610f3d072978e2;
    stim[48] = 70'h0d7644c00af1027a42;
    stim[49] = 70'h2d0524051fd0fc2380;
    stim[50] = 70'h1fac0b238995ec986b;
    stim[51] = 70'h0b12b64e577a787e54;
    stim[52] = 70'h1c698b079acff6f4b3;
    stim[53] = 70'h16e606f1328956fbfa;
    stim[54] = 70'h1588d777e298b9d609;
    stim[55] = 70'h165d6af30893314fc5;
    stim[56] = 70'h066d864535c265dbc0;
    stim[57] = 70'h08b7bf243f8237da8e;
    stim[58] = 70'h136753452d5f164ad1;
    stim[59] = 70'h0c322e2f080b526c74;
    stim[60] = 70'h1e8526dc19c6382ddb;
    stim[61] = 70'h041498fd5a47ffaa7b;
    stim[62] = 70'h17740318e51c250c24;
    stim[63] = 70'h04ad8a85376f3bdfbc;
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
      expv[0] = 33'h1c17b3e92;
      expv[1] = 33'h019cafd4e;
      expv[2] = 33'h1bf1490c4;
      expv[3] = 33'h101256318;
      expv[4] = 33'h173e13d30;
      expv[5] = 33'h09158e747;
      expv[6] = 33'h02d18254a;
      expv[7] = 33'h1b2ff4c12;
      expv[8] = 33'h07fd20718;
      expv[9] = 33'h0f5ebd376;
      expv[10] = 33'h05995277e;
      expv[11] = 33'h0e4188188;
      expv[12] = 33'h04f47f960;
      expv[13] = 33'h0faa4ae26;
      expv[14] = 33'h1bc9ef2b0;
      expv[15] = 33'h053c7383a;
      expv[16] = 33'h0b21bbbda;
      expv[17] = 33'h0751fb6bc;
      expv[18] = 33'h16ec70248;
      expv[19] = 33'h0babfbd16;
      expv[20] = 33'h13cec776a;
      expv[21] = 33'h01d9c9c6e;
      expv[22] = 33'h00c46c872;
      expv[23] = 33'h0524c013e;
      expv[24] = 33'h19962d766;
      expv[25] = 33'h11f3cca5a;
      expv[26] = 33'h04af8f30e;
      expv[27] = 33'h09e390852;
      expv[28] = 33'h1380a5a5e;
      expv[29] = 33'h026bff6fa;
      expv[30] = 33'h08c97333a;
      expv[31] = 33'h05e88b9f0;
      expv[32] = 33'h01507a35a;
      expv[33] = 33'h183f53266;
      expv[34] = 33'h10862c19a;
      expv[35] = 33'h1b3e015ca;
      expv[36] = 33'h0885beec2;
      expv[37] = 33'h1b79a097e;
      expv[38] = 33'h1da9e61b0;
      expv[39] = 33'h1fc35a17a;
      expv[40] = 33'h116aa4fb2;
      expv[41] = 33'h18fba1714;
      expv[42] = 33'h06ffc01d0;
      expv[43] = 33'h13794c128;
      expv[44] = 33'h190322c06;
      expv[45] = 33'h0b224ef22;
      expv[46] = 33'h03a275e1a;
      expv[47] = 33'h1072978e2;
      expv[48] = 33'h0f1027a42;
      expv[49] = 33'h1d0fc2380;
      expv[50] = 33'h195ec986a;
      expv[51] = 33'h17a787e54;
      expv[52] = 33'h0cff6f4b2;
      expv[53] = 33'h08956fbfa;
      expv[54] = 33'h098b9d608;
      expv[55] = 33'h093314fc4;
      expv[56] = 33'h1c265dbc0;
      expv[57] = 33'h18237da8e;
      expv[58] = 33'h15f164ad0;
      expv[59] = 33'h00b526c74;
      expv[60] = 33'h1c6382dda;
      expv[61] = 33'h047ffaa7a;
      expv[62] = 33'h11c250c24;
      expv[63] = 33'h16f3bdfbc;
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
