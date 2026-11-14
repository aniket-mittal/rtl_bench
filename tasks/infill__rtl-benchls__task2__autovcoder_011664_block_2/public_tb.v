// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011664 dut (
    .clk_sys(clk),
    .rst(in_vec[107:107]),
    .addr_in(in_vec[106:75]),
    .write_in(in_vec[74:74]),
    .writedata_in(in_vec[73:42]),
    .read_in(in_vec[41:41]),
    .byteenable_in(in_vec[40:37]),
    .burstcount_in(in_vec[36:34]),
    .readdata_in(in_vec[33:2]),
    .readdatavalid_in(in_vec[1:1]),
    .waitrequest_in(in_vec[0:0]),
    .readdata_out(out_vec[103:72]),
    .readdatavalid_out(out_vec[71:71]),
    .waitrequest_out(out_vec[70:70]),
    .addr_out(out_vec[69:38]),
    .write_out(out_vec[37:37]),
    .writedata_out(out_vec[36:5]),
    .read_out(out_vec[4:4]),
    .byteenable_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'hc05059cdde8e1def44b6e30a62b;
    stim[1] = 108'hebb593be9b7a397cd8a374f634f;
    stim[2] = 108'h4027b6b4c35f90e2604baa78629;
    stim[3] = 108'h0e31bb55b74f6b2a429c7cfa73f;
    stim[4] = 108'h40baa3599d0ed58079c40fb2d21;
    stim[5] = 108'h041bb5d5fd38ff705bf5d305cc3;
    stim[6] = 108'h1dbd75b582d6f3ad5d4a9f7a7c2;
    stim[7] = 108'h2f23da80190236c3530573b8c55;
    stim[8] = 108'h77995bfcfa69c204feec6f76076;
    stim[9] = 108'h15602bfc7300203aa733cc58ec5;
    stim[10] = 108'h0e4b9ab540bfcf6a19e5a6fc87a;
    stim[11] = 108'h16ccab6131dcc045ca6c288d269;
    stim[12] = 108'h3ba69c378e28ac8e2f77d3883d0;
    stim[13] = 108'h14e11c73e0ef02f553959227fac;
    stim[14] = 108'h185083c403f37beca36dfd81c6d;
    stim[15] = 108'h43e2d43ca2d08c65f53e84b1c53;
    stim[16] = 108'h5c12ea8d29aae759e9033a1b37a;
    stim[17] = 108'h4c383a6b537e86dc6b7a4ad9120;
    stim[18] = 108'h760d5f656514e6ae829e7fd91f2;
    stim[19] = 108'h5d0c91f070a1b86230e498dad74;
    stim[20] = 108'h6b6f8312b21105b0f4af8db1f0c;
    stim[21] = 108'h5cd557206afc8f101d8d75c9abf;
    stim[22] = 108'h08ac0775621dba9f4a2af70a878;
    stim[23] = 108'h29f9ba67295dd237891d3c97d4d;
    stim[24] = 108'h5b4f7568e94955321d7cabc1068;
    stim[25] = 108'h31979c6bb064033a3ca575ff35d;
    stim[26] = 108'h4952555449b9ae615fa88e72a5f;
    stim[27] = 108'h4f6d2f663b8fc0806d894eebe07;
    stim[28] = 108'h2b4b3b496b2b663be2f1c3018dc;
    stim[29] = 108'h7673e307fb7e63979bf241b5092;
    stim[30] = 108'h78983aa95796e01c62c7bea0b11;
    stim[31] = 108'h39ce06c09d48c6a78287c78218f;
    stim[32] = 108'h01311463ea07168e69f263a5848;
    stim[33] = 108'h6e3cbc20cd4d73b37917ff3f56a;
    stim[34] = 108'h7a42363f4a205ccaad312153709;
    stim[35] = 108'h72722baf9c048127ae2a136ee58;
    stim[36] = 108'h43abb46a744906131850a824806;
    stim[37] = 108'h543ca4ad1a19adf4b446c98eef2;
    stim[38] = 108'h6d9f1e106e2b31a356cfd303a7f;
    stim[39] = 108'h861f0509977d17fab1cd149fb46;
    stim[40] = 108'h4b882bcf07d0220849425d9b918;
    stim[41] = 108'h20afa13b8fc426d3e1df4734e2e;
    stim[42] = 108'h3911973184e2f5a1d12016d8e3f;
    stim[43] = 108'h20b560a4c263c5bafe9dffa5be7;
    stim[44] = 108'h62b213c0746d3d7539ac98f4a6f;
    stim[45] = 108'h57dd927b5c95b24f1c962cefb24;
    stim[46] = 108'h3aaa8b1a09c22772ccb3832a775;
    stim[47] = 108'h7cd45998812b1250918a3403240;
    stim[48] = 108'h4ad3042703b71879e7407fea2cc;
    stim[49] = 108'h319e38dcaf416c5d9427da34c47;
    stim[50] = 108'h0b5f11503a8edc6404356f78b96;
    stim[51] = 108'h77267714d9fc7b249cc99243ad6;
    stim[52] = 108'h2c69a3d9e8807a772468d9a7d91;
    stim[53] = 108'h448dceafcba953c23ba05ca02d6;
    stim[54] = 108'h522b5f35100de86add07cb8d018;
    stim[55] = 108'h3da080ab52f0ab007c0c1f15ff3;
    stim[56] = 108'h75e51f1ac364edcb47d969ba067;
    stim[57] = 108'h259ebe1b984cede3ada556d5eba;
    stim[58] = 108'h413d7e6bc90720187db80fafe23;
    stim[59] = 108'h3bc51ce6d3ef4ebea634d849530;
    stim[60] = 108'h34f52fe9a23a0cabf8f2827a7ef;
    stim[61] = 108'h1306316ffee29126b69d0e0ec79;
    stim[62] = 108'h6e1f181bdb5142d9426abf2426e;
    stim[63] = 108'h3bc8a6a82c4339eb458d19bc6df;
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
      expv[0] = 104'hdb8c298axxxxxxxxxf470ef7x2;
      expv[1] = 104'h8dd3d8d3f5dac9df4dbd1cbe6c;
      expv[2] = 104'h2ea9e18a6013db5a61afc87130;
      expv[3] = 104'h71f3e9cfc718ddaadba7b59521;
      expv[4] = 104'h103ecb48605d51acce876ac03c;
      expv[5] = 104'hd74c1730c20ddaeafe9c7fb82d;
      expv[6] = 104'h2a7de9f08edebadac16b79d6ae;
      expv[7] = 104'h15cee3155791ed400c811b61a9;
      expv[8] = 104'hb1bdd81dbbccadfe7d34e1027f;
      expv[9] = 104'hcf3163b17bccadff7980101d53;
      expv[10] = 104'h969bf21ebbccadff605fe7b51c;
      expv[11] = 104'hb0a2349a7bccae0058ee6022f5;
      expv[12] = 104'hdf4e20f43bccae004714564717;
      expv[13] = 104'h56489feb0a708e39f077817aa9;
      expv[14] = 104'hb7f6071b4c2841e201f9bdf651;
      expv[15] = 104'hfa12c714e1f16a1e51684632fa;
      expv[16] = 104'h0ce86cdeae09754694d573acf4;
      expv[17] = 104'he92b64482e097547a9bf436e35;
      expv[18] = 104'h79ff647cae097548b28a735751;
      expv[19] = 104'h92636b5d2e097549b850dc3118;
      expv[20] = 104'hbe36c7c335b7c189590882d87a;
      expv[21] = 104'h35d726aff5b7c18a757e47881e;
      expv[22] = 104'habdc2a1e35b7c18a710edd4fb5;
      expv[23] = 104'h74f25f5354fcdd3394aee91bc4;
      expv[24] = 104'hf2af041a2da7bab474a4aa990e;
      expv[25] = 104'h95d7fcd758cbce35d832019d1e;
      expv[26] = 104'ha239ca97e4a92aaa24dcd730af;
      expv[27] = 104'h253baf81e7b697b31dc7e04036;
      expv[28] = 104'hc70c063715a59da4b595b31df1;
      expv[29] = 104'hc906d42495a59da5bdbf31cbdd;
      expv[30] = 104'h1efa82c455a59da6abcb700e31;
      expv[31] = 104'h1f1e0863d5a59da68ea46353d1;
      expv[32] = 104'hc98e961215a59da6b5038b4734;
      expv[33] = 104'h5ffcfd5ab71e5e1066a6b9d9bc;
      expv[34] = 104'hc4854dc2771e5e1165102e6556;
      expv[35] = 104'ha84dbb96371e5e114e024093d7;
      expv[36] = 104'h42a09201b71e5e127a2483099c;
      expv[37] = 104'h1b263bbcb71e5e134d0cd6fa5a;
      expv[38] = 104'h3f4c0e9ff6cf8f08371598d1ab;
      expv[39] = 104'h34527ed1830f8284cbbe8bfd58;
      expv[40] = 104'h09766e4625c415e783e8110424;
      expv[41] = 104'h7d1cd38b9057d09dc7e21369f0;
      expv[42] = 104'h805b638fdc88cb98c2717ad0e8;
      expv[43] = 104'h77fe96f9d05ab0526131e2dd7f;
      expv[44] = 104'hb263d29bf15909e03a369eba9c;
      expv[45] = 104'h58b3bec92beec93dae4ad9278e;
      expv[46] = 104'hce0ca9dd6beec93e84e113b966;
      expv[47] = 104'h28d00c902beec93e8095892848;
      expv[48] = 104'h01ffa8b32569821381db8c3cf3;
      expv[49] = 104'h9f68d311d8cf1c6e57a0b62eca;
      expv[50] = 104'hd5bde2e585af88a81d476e3202;
      expv[51] = 104'h26490eb5bb933b8a6cfe3d924e;
      expv[52] = 104'ha3669f647b933b8b74403d3b92;
      expv[53] = 104'h817280b5bb933b8b65d4a9e11d;
      expv[54] = 104'h1f2e34063b933b8c4806f4356e;
      expv[55] = 104'h307c57fcded04055a97855802e;
      expv[56] = 104'h65a6e819faf28f8d61b276e5a3;
      expv[57] = 104'h955b57ae92cf5f0dcc2676f1d6;
      expv[58] = 104'he03ebf88e09ebf35e483900c3e;
      expv[59] = 104'hd361254c1de28e7369f7a75f43;
      expv[60] = 104'hca09e9fbda7a97f4d11d0655fc;
      expv[61] = 104'h74383b1e498318b7ff7148935b;
      expv[62] = 104'haafc909bb70f8c0deda8a16ca1;
      expv[63] = 104'h3466f1b7dde4535416219cf5a2;
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
