// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 96;
  localparam OW = 82;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02768 dut (
    .HCLK(clk),
    .HRESETn(in_vec[95:95]),
    .HRDATA(in_vec[94:63]),
    .HREADY(in_vec[62:62]),
    .HRESP(in_vec[61:61]),
    .NMI(in_vec[60:60]),
    .IRQ(in_vec[59:28]),
    .RXEV(in_vec[27:27]),
    .STCLKEN(in_vec[26:26]),
    .STCALIB(in_vec[25:0]),
    .HADDR(out_vec[81:50]),
    .HBURST(out_vec[49:47]),
    .HMASTLOCK(out_vec[46:46]),
    .HPROT(out_vec[45:42]),
    .HSIZE(out_vec[41:39]),
    .HTRANS(out_vec[38:37]),
    .HWDATA(out_vec[36:5]),
    .HWRITE(out_vec[4:4]),
    .TXEV(out_vec[3:3]),
    .LOCKUP(out_vec[2:2]),
    .SYSRESETREQ(out_vec[1:1]),
    .SLEEPING(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 96'h06987b0c0d4dd0f2961b999d;
    stim[1] = 96'h210fe3453ca0469793b34856;
    stim[2] = 96'h9234cf87287e669522422521;
    stim[3] = 96'hc454f79775e72b8f70a04d3e;
    stim[4] = 96'hc1b2968b34208728a5823f7c;
    stim[5] = 96'ha5ca082592e1aedef62851e0;
    stim[6] = 96'hd8b942ec780905865565d98a;
    stim[7] = 96'hef70d9ba7420b3ecf0ec7d18;
    stim[8] = 96'h014e79cc180430029bcb51c3;
    stim[9] = 96'h8d5dfb820734f123a82847af;
    stim[10] = 96'hbdff42b1f1a415895caa7c8e;
    stim[11] = 96'heab97d76b7d1894f985bdfa2;
    stim[12] = 96'h90547157ff566ef51069ae70;
    stim[13] = 96'h2c6323386efb794667e57906;
    stim[14] = 96'hf46974bfffdd96bebffc1222;
    stim[15] = 96'he7e6ade2e4e64a3fc95de8a5;
    stim[16] = 96'hdb38a2cc38778ffa1cd97426;
    stim[17] = 96'he07fa1a04da4ad6d746e4946;
    stim[18] = 96'hb723a911dadd29ce928c3dee;
    stim[19] = 96'hd0d4516d7e0402b468eae20b;
    stim[20] = 96'he5fe7b2ea620978848475bb8;
    stim[21] = 96'he3820401aabefe462f0ee997;
    stim[22] = 96'hef480b183114fadfdc9f211e;
    stim[23] = 96'h97bf860274ecca16a021e83e;
    stim[24] = 96'hf7fff069f0bb4330c494b214;
    stim[25] = 96'hb9eecde0804493487953f91f;
    stim[26] = 96'hfcaf547926a9c215bd03be0a;
    stim[27] = 96'hebef8aa59d46a96ca9c4802a;
    stim[28] = 96'h81141984816e205cb0ff643f;
    stim[29] = 96'h9a5f49916c5aa40ea87ddf39;
    stim[30] = 96'hc646ad683b441ba318021fc5;
    stim[31] = 96'hba1593a4a635f758d2c771f6;
    stim[32] = 96'he5c129f841eb49f3a6cc7eab;
    stim[33] = 96'hf911e7b7a704661802d4f79a;
    stim[34] = 96'hcc17d56230118945a0647294;
    stim[35] = 96'hba0ef701269d99ae63b47c8a;
    stim[36] = 96'h63ddb9fe674f7b172fd96cee;
    stim[37] = 96'hc4ba460e092fbae453bf3d04;
    stim[38] = 96'hc77dd32a433aa266724eec6c;
    stim[39] = 96'ha36f6f98d667c13d57e853c8;
    stim[40] = 96'hc3b1ec0a8df13ccc194ca421;
    stim[41] = 96'h80fe82838198a677df50b3a4;
    stim[42] = 96'hc9d3f73df10caebc63873c3c;
    stim[43] = 96'hd76cb816bb49ac68478d1abc;
    stim[44] = 96'ha9a7970df74d8ddd6846619a;
    stim[45] = 96'h98cbc5b423bc3d0c38cb87ec;
    stim[46] = 96'hed91bb629cdedad54cbbd652;
    stim[47] = 96'he138951626720f14d1681770;
    stim[48] = 96'h83d9204ab7d4f3616cab6307;
    stim[49] = 96'h400f856c737d6dc1be6fd053;
    stim[50] = 96'hd498364dfda65b9604d9332a;
    stim[51] = 96'hcdf81c582fd4f30cb516ef6b;
    stim[52] = 96'h9e2106d747fc9715985c223f;
    stim[53] = 96'hf58f4776b5ff6a438328084e;
    stim[54] = 96'hb65cfd1b1975098e6523c47c;
    stim[55] = 96'hf0575953b28bfec36df44f24;
    stim[56] = 96'hc4af4bf2316c4302049291b2;
    stim[57] = 96'h5343b78eaaf1ddb1015f941a;
    stim[58] = 96'h8db48905a451b1fd9d3e450e;
    stim[59] = 96'hc0d78686a0f7829011482814;
    stim[60] = 96'ha5a8b03a5911c295d126a67e;
    stim[61] = 96'hf990af95a537c595222511ef;
    stim[62] = 96'hcacf78626a903349a9ee5906;
    stim[63] = 96'hef7227abf0097fff233f459d;
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
      expv[0] = 82'h000000000000000000000;
      expv[1] = 82'h000000000000000000000;
      expv[2] = 82'h000000000000000000000;
      expv[3] = 82'h000000000000000000000;
      expv[4] = 82'h000000000000000000000;
      expv[5] = 82'h000000000000000000000;
      expv[6] = 82'h000000000000000000000;
      expv[7] = 82'h000000000000000000000;
      expv[8] = 82'h000000000000000000000;
      expv[9] = 82'h000000000000000000000;
      expv[10] = 82'h000000000000000000000;
      expv[11] = 82'h000000000000000000000;
      expv[12] = 82'h000000000000000000000;
      expv[13] = 82'h000000000000000000000;
      expv[14] = 82'h000000000000000000000;
      expv[15] = 82'h000000000000000000000;
      expv[16] = 82'h000000000000000000000;
      expv[17] = 82'h000000000000000000000;
      expv[18] = 82'h000000000000000000000;
      expv[19] = 82'h000000000000000000000;
      expv[20] = 82'h000000000000000000000;
      expv[21] = 82'h000000000000000000000;
      expv[22] = 82'h000000000000000000000;
      expv[23] = 82'h000000000000000000000;
      expv[24] = 82'h000000000000000000000;
      expv[25] = 82'h000000000000000000000;
      expv[26] = 82'h000000000000000000000;
      expv[27] = 82'h000000000000000000000;
      expv[28] = 82'h000000000000000000000;
      expv[29] = 82'h000000000000000000000;
      expv[30] = 82'h000000000000000000000;
      expv[31] = 82'h000000000000000000000;
      expv[32] = 82'h000000000000000000000;
      expv[33] = 82'h000000000000000000000;
      expv[34] = 82'h000000000000000000000;
      expv[35] = 82'h000000000000000000000;
      expv[36] = 82'h000000000000000000000;
      expv[37] = 82'h000000000000000000000;
      expv[38] = 82'h000000000000000000000;
      expv[39] = 82'h000000000000000000000;
      expv[40] = 82'h000000000000000000000;
      expv[41] = 82'h000000000000000000000;
      expv[42] = 82'h000000000000000000000;
      expv[43] = 82'h000000000000000000000;
      expv[44] = 82'h000000000000000000000;
      expv[45] = 82'h000000000000000000000;
      expv[46] = 82'h000000000000000000000;
      expv[47] = 82'h000000000000000000000;
      expv[48] = 82'h000000000000000000000;
      expv[49] = 82'h000000000000000000000;
      expv[50] = 82'h000000000000000000000;
      expv[51] = 82'h000000000000000000000;
      expv[52] = 82'h000000000000000000000;
      expv[53] = 82'h000000000000000000000;
      expv[54] = 82'h000000000000000000000;
      expv[55] = 82'h000000000000000000000;
      expv[56] = 82'h000000000000000000000;
      expv[57] = 82'h000000000000000000000;
      expv[58] = 82'h000000000000000000000;
      expv[59] = 82'h000000000000000000000;
      expv[60] = 82'h000000000000000000000;
      expv[61] = 82'h000000000000000000000;
      expv[62] = 82'h000000000000000000000;
      expv[63] = 82'h000000000000000000000;
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
