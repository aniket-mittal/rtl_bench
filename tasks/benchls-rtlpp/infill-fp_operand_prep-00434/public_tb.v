// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00434 dut (
    .clk_i(clk),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .fracta_28_o(out_vec[63:36]),
    .fractb_28_o(out_vec[35:8]),
    .exp_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h45d637d449e32792;
    stim[1] = 64'h6067e0a3f8f772f6;
    stim[2] = 64'hb61269c7c3894ac9;
    stim[3] = 64'h121d8ee084cfa9df;
    stim[4] = 64'h536144b20ec3c65e;
    stim[5] = 64'he93a48791e1f4779;
    stim[6] = 64'h8e0fe1488209e8aa;
    stim[7] = 64'h8965fadf3b81f037;
    stim[8] = 64'hd89be1275ca58cc0;
    stim[9] = 64'h5fbb93d89009d773;
    stim[10] = 64'h12b45fdeb2f552d3;
    stim[11] = 64'hf2cb954632adcfe4;
    stim[12] = 64'hf27874cf87cb21c5;
    stim[13] = 64'h48891e7ece1c36e5;
    stim[14] = 64'h16dab615f1209673;
    stim[15] = 64'h0a88f8ee3e611a77;
    stim[16] = 64'h64beae350cd8553e;
    stim[17] = 64'hc8d7119261ed0434;
    stim[18] = 64'hefc3951c6b3529b9;
    stim[19] = 64'had443fef4f29dc0c;
    stim[20] = 64'h692b65a1a158281e;
    stim[21] = 64'hdb2cbccd35f99da3;
    stim[22] = 64'hd22ad550cfe0539a;
    stim[23] = 64'h9037ad8e230f76e8;
    stim[24] = 64'hdef06561a0b282f9;
    stim[25] = 64'hefb3f6ea3ad5f18c;
    stim[26] = 64'h9af14c0714863160;
    stim[27] = 64'h0c2f15f58fd30407;
    stim[28] = 64'hf563b67c141bd93f;
    stim[29] = 64'ha919f414a800a297;
    stim[30] = 64'h26d2c7bea019dc63;
    stim[31] = 64'h9770c886dd910634;
    stim[32] = 64'h0e1812985fb9a22e;
    stim[33] = 64'h0ef2fb80b8f3b64d;
    stim[34] = 64'h76c1e8e2240e979f;
    stim[35] = 64'hf2781da45aece7d8;
    stim[36] = 64'hba683b4e9f0a6202;
    stim[37] = 64'h3cf3904465516c6f;
    stim[38] = 64'h218f49c1a653e87d;
    stim[39] = 64'h5670d48807bcb6ae;
    stim[40] = 64'h516360efd16b36b9;
    stim[41] = 64'h4af497f4d5fb0755;
    stim[42] = 64'hca35ed813e3662d3;
    stim[43] = 64'hfb40fc2adc5bffbe;
    stim[44] = 64'hdeeb47a00ae467c6;
    stim[45] = 64'h4d1dc5bb813df9be;
    stim[46] = 64'h3b2dd60c4c1b2c57;
    stim[47] = 64'h3a88f40b4b51f6d4;
    stim[48] = 64'ha409985af9a9f04d;
    stim[49] = 64'h10bf60771b124d19;
    stim[50] = 64'ha47cd350b87acf00;
    stim[51] = 64'h7ef7c4becc4689dc;
    stim[52] = 64'hf90dc1204adeb9cb;
    stim[53] = 64'h3dc3df8e37142f2a;
    stim[54] = 64'hfa6fa7753870c10e;
    stim[55] = 64'h25537d2ff2499641;
    stim[56] = 64'hfcf09152fcc0713d;
    stim[57] = 64'h5f167745a552bab6;
    stim[58] = 64'hdc5e7d465d0db93d;
    stim[59] = 64'hb94b253f08472891;
    stim[60] = 64'h17f430ddba946f8a;
    stim[61] = 64'h38fcbcc89a45ee53;
    stim[62] = 64'h583718fad847079a;
    stim[63] = 64'h0d8d912d3881c6b7;
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
      expv[1] = 64'hxxxxxxx7193c90xx;
      expv[2] = 64'h0073f057bb97b093;
      expv[3] = 64'h000000144a5648f1;
      expv[4] = 64'h4ec7700000000187;
      expv[5] = 64'h70a2590000000124;
      expv[6] = 64'h5d243c80000001a6;
      expv[7] = 64'h47f0a400000001d2;
      expv[8] = 64'h000000740f81b81c;
      expv[9] = 64'h000000152c660077;
      expv[10] = 64'h5dc9ec00044ebbb9;
      expv[11] = 64'h00000017aa9698bf;
      expv[12] = 64'h65caa30000000165;
      expv[13] = 64'h7c3a6780000001e5;
      expv[14] = 64'h00000014e1b728e4;
      expv[15] = 64'h000dab7504b3989c;
      expv[16] = 64'h0000001708d3b8e2;
      expv[17] = 64'h5f571a800000017c;
      expv[18] = 64'h000000176821a0c9;
      expv[19] = 64'h61ca8e00000001c3;
      expv[20] = 64'h00310ff54ee060df;
      expv[21] = 64'h55b2d0800000019e;
      expv[22] = 64'h565e6680000001d2;
      expv[23] = 64'h556aa800000001b6;
      expv[24] = 64'h02deb6347bb740a4;
      expv[25] = 64'h7832b08000000146;
      expv[26] = 64'h59fb7500000001bd;
      expv[27] = 64'h78a60380000001df;
      expv[28] = 64'h000578b698203835;
      expv[29] = 64'h71db3e0009bd931f;
      expv[30] = 64'h4cfa0a00000001ea;
      expv[31] = 64'h6963df0133b8c652;
      expv[32] = 64'h0003c3348831a04d;
      expv[33] = 64'h00000015cd1170bb;
      expv[34] = 64'h000000179db268bf;
      expv[35] = 64'h60f4710000000171;
      expv[36] = 64'h7c0ed200000001ed;
      expv[37] = 64'h741da700000001e4;
      expv[38] = 64'h000000168b637874;
      expv[39] = 64'h000000169f43e8ca;
      expv[40] = 64'h786a440002f2db4c;
      expv[41] = 64'h0000001759b5c8ac;
      expv[42] = 64'h7a4bfa07d83aa8a2;
      expv[43] = 64'h5af6c080000017ab;
      expv[44] = 64'h607e150000000794;
      expv[45] = 64'h75a3d000000001f6;
      expv[46] = 64'h4ee2dd80000001bd;
      expv[47] = 64'h00000014d962b89a;
      expv[48] = 64'h000000168fb6a098;
      expv[49] = 64'h000000154f826896;
      expv[50] = 64'h000000149268c8f3;
      expv[51] = 64'h000003f7d6780036;
      expv[52] = 64'h7be25f0000000170;
      expv[53] = 64'h46e09000000001fd;
      expv[54] = 64'h61efc700000001f2;
      expv[55] = 64'h77d3ba80003c317b;
      expv[56] = 64'h000000164cb208f4;
      expv[57] = 64'h000000160389e8e4;
      expv[58] = 64'h4b3ba28695d5b0f9;
      expv[59] = 64'h000000146dc9e8be;
      expv[60] = 64'h65929f818e5122ba;
      expv[61] = 64'h00000014a37c5072;
      expv[62] = 64'h7e5e640000000175;
      expv[63] = 64'h00000016383cd071;
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
