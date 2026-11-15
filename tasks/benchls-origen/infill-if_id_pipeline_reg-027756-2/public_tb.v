// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 134;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027756 dut (
    .clk(clk),
    .stall(in_vec[133:133]),
    .OPin(in_vec[132:127]),
    .FUNCTin(in_vec[126:121]),
    .A1in(in_vec[120:116]),
    .A2in(in_vec[115:111]),
    .RDin(in_vec[110:106]),
    .IMMin(in_vec[105:90]),
    .ADin(in_vec[89:64]),
    .PCADD4in(in_vec[63:32]),
    .PCin(in_vec[31:0]),
    .OPout(out_vec[132:127]),
    .FUNCTout(out_vec[126:121]),
    .A1out(out_vec[120:116]),
    .A2out(out_vec[115:111]),
    .RDout(out_vec[110:106]),
    .IMMout(out_vec[105:90]),
    .ADout(out_vec[89:64]),
    .PCADD4out(out_vec[63:32]),
    .PCout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 134'h1c30e2e030e5d967e70c2204dba3030c07;
    stim[1] = 134'h210d5323bfbecc42fa5ff068ccbb3656d3;
    stim[2] = 134'h18cd0538986333b8e7a49cff763010307e;
    stim[3] = 134'h37069db2f3870bfc3b3492267b064502c6;
    stim[4] = 134'h0a906effcdbb98a36c52efc25c0dc8fdcb;
    stim[5] = 134'h1cf0c48fd969619b961d19bad9263fe513;
    stim[6] = 134'h33c033e43a1ff5773ebec91c0c15b8de00;
    stim[7] = 134'h0af0677b7d286154b3193f09640c4b9e6d;
    stim[8] = 134'h0642a72a1833533c341f271873b830d9df;
    stim[9] = 134'h2fe0246e1cfdb020334e726c9a8c0df248;
    stim[10] = 134'h3780571820a58e5c04e106f6838f25c73a;
    stim[11] = 134'h34bb7353a5f8cd47c2444dd60cd5810f24;
    stim[12] = 134'h03334b9ee6ae0653fe29a63fb06f0e6514;
    stim[13] = 134'h336f8326d49a0a0cda57123ff0e79d3614;
    stim[14] = 134'h130d572da796e7b35d67820a863608d86c;
    stim[15] = 134'h3df44eaf57e2426e8e4568ee6c7260bed5;
    stim[16] = 134'h3febf4635d0b18fbe5b72abd816e63df2a;
    stim[17] = 134'h0d872edf52f3848236421b8bc9c19b0a35;
    stim[18] = 134'h012bd482bee83399e57780aa61646ecce3;
    stim[19] = 134'h29bcd6268c9a264306eba750d3f88e5294;
    stim[20] = 134'h100b4ce1fd2cc489889f9501505665a34d;
    stim[21] = 134'h32884ba4d932aa842c807a1d7b7e1dc0a7;
    stim[22] = 134'h0f113c9fcdfbcd3d3347513fc5834ec1b1;
    stim[23] = 134'h05331b523d419c267158b01b2b99e7726a;
    stim[24] = 134'h1a1a0ef02b4dfa27edbd81b1282d61d551;
    stim[25] = 134'h1db6321cd423c15e8e322c29b7e105637a;
    stim[26] = 134'h2e4ed610b57d84a883a9479f63e29c8c60;
    stim[27] = 134'h2e33d05a4a4ccd3b6a87e7c18255467aec;
    stim[28] = 134'h1bb47149fdab48e98ec522f17cd7ae7a0d;
    stim[29] = 134'h3a88eeb916fd2eccd5604213ed27dea93f;
    stim[30] = 134'h2de3a7c8e5002bf0963560b93db63cea5d;
    stim[31] = 134'h2a68dbe8511949e1483246eb26a9906bde;
    stim[32] = 134'h12166e0e36dacaa19a0b6fc44237e11e51;
    stim[33] = 134'h005d4e6cdb3f8b117268a3fbc448dfd72c;
    stim[34] = 134'h0eb15be88fa26ca4322a344305840262bd;
    stim[35] = 134'h286b7bea840583403f7e3fba457d2e856d;
    stim[36] = 134'h085adac18437eca3eab86f883a3dbc1c6a;
    stim[37] = 134'h19f959255a9203fb48bc853f11aec30628;
    stim[38] = 134'h2c48ff50388149eb54408b376bbb76efa0;
    stim[39] = 134'h124dee91921a66014dec7630a0726f974e;
    stim[40] = 134'h346862586d6f55e234e66dee5153f3b91d;
    stim[41] = 134'h1414734d57cdd3963f81850e56458e80c4;
    stim[42] = 134'h02478a455cc4facb446ac5fd3a74941fa1;
    stim[43] = 134'h332b4e79b365d4befb9174a5b126d573c4;
    stim[44] = 134'h14149ddc1a693f7e4526ea7a84a7eac571;
    stim[45] = 134'h0bdc2ed7efb1f923d7a9e672c601865fda;
    stim[46] = 134'h1c96ef7fc99793aff1458731bd789d274a;
    stim[47] = 134'h2a3f65f057273805e06cd9911b9e70fd72;
    stim[48] = 134'h351e856c3893b7968a3e18b13ee2f83305;
    stim[49] = 134'h14c8941f4c013aa45bae710652e660bda6;
    stim[50] = 134'h2ff468b364de6cf51a7c5d40ee357168ce;
    stim[51] = 134'h1e1b1402338d9a573f49a334fb8249e504;
    stim[52] = 134'h02a82c101fb9a5b8ec854dcc8384aff2a0;
    stim[53] = 134'h01e60c45f0d9dd8bc28f5aff06ddfa2a27;
    stim[54] = 134'h02e6dd49821f1beb028ae0f60089f8c9d9;
    stim[55] = 134'h1f10f80c49399ff6466953095417e85cec;
    stim[56] = 134'h3aa04362ecedef134158a522a35ce31fc4;
    stim[57] = 134'h3922ed68a122a65c93ef1f81582df164f8;
    stim[58] = 134'h01f1fc8e19c157032516aee0fd4e56e685;
    stim[59] = 134'h26c2e6ad45cac7a27d066e78c8c9e64431;
    stim[60] = 134'h265c727bf65b6609f00be55fa40f9c018c;
    stim[61] = 134'h387e14c5fe0b98b4f7ebe46e2fe72d0927;
    stim[62] = 134'h0ed3753a7d36b084b39d144feccc710333;
    stim[63] = 134'h037a64c0ae6b151739c010de1860ec3268;
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
      expv[0] = 133'h0000000000000000000000000000000000;
      expv[1] = 133'h1c30e2e030e5d967e70c2204dba3030c07;
      expv[2] = 133'h1c30e2e030e5d967e70c2204dba3030c07;
      expv[3] = 133'h18cd0538986333b8e7a49cff763010307e;
      expv[4] = 133'h18cd0538986333b8e7a49cff763010307e;
      expv[5] = 133'h0a906effcdbb98a36c52efc25c0dc8fdcb;
      expv[6] = 133'h1cf0c48fd969619b961d19bad9263fe513;
      expv[7] = 133'h1cf0c48fd969619b961d19bad9263fe513;
      expv[8] = 133'h0af0677b7d286154b3193f09640c4b9e6d;
      expv[9] = 133'h0642a72a1833533c341f271873b830d9df;
      expv[10] = 133'h0642a72a1833533c341f271873b830d9df;
      expv[11] = 133'h0642a72a1833533c341f271873b830d9df;
      expv[12] = 133'h0642a72a1833533c341f271873b830d9df;
      expv[13] = 133'h03334b9ee6ae0653fe29a63fb06f0e6514;
      expv[14] = 133'h03334b9ee6ae0653fe29a63fb06f0e6514;
      expv[15] = 133'h130d572da796e7b35d67820a863608d86c;
      expv[16] = 133'h130d572da796e7b35d67820a863608d86c;
      expv[17] = 133'h130d572da796e7b35d67820a863608d86c;
      expv[18] = 133'h0d872edf52f3848236421b8bc9c19b0a35;
      expv[19] = 133'h012bd482bee83399e57780aa61646ecce3;
      expv[20] = 133'h012bd482bee83399e57780aa61646ecce3;
      expv[21] = 133'h100b4ce1fd2cc489889f9501505665a34d;
      expv[22] = 133'h100b4ce1fd2cc489889f9501505665a34d;
      expv[23] = 133'h0f113c9fcdfbcd3d3347513fc5834ec1b1;
      expv[24] = 133'h05331b523d419c267158b01b2b99e7726a;
      expv[25] = 133'h1a1a0ef02b4dfa27edbd81b1282d61d551;
      expv[26] = 133'h1db6321cd423c15e8e322c29b7e105637a;
      expv[27] = 133'h1db6321cd423c15e8e322c29b7e105637a;
      expv[28] = 133'h1db6321cd423c15e8e322c29b7e105637a;
      expv[29] = 133'h1bb47149fdab48e98ec522f17cd7ae7a0d;
      expv[30] = 133'h1bb47149fdab48e98ec522f17cd7ae7a0d;
      expv[31] = 133'h1bb47149fdab48e98ec522f17cd7ae7a0d;
      expv[32] = 133'h1bb47149fdab48e98ec522f17cd7ae7a0d;
      expv[33] = 133'h12166e0e36dacaa19a0b6fc44237e11e51;
      expv[34] = 133'h005d4e6cdb3f8b117268a3fbc448dfd72c;
      expv[35] = 133'h0eb15be88fa26ca4322a344305840262bd;
      expv[36] = 133'h0eb15be88fa26ca4322a344305840262bd;
      expv[37] = 133'h085adac18437eca3eab86f883a3dbc1c6a;
      expv[38] = 133'h19f959255a9203fb48bc853f11aec30628;
      expv[39] = 133'h19f959255a9203fb48bc853f11aec30628;
      expv[40] = 133'h124dee91921a66014dec7630a0726f974e;
      expv[41] = 133'h124dee91921a66014dec7630a0726f974e;
      expv[42] = 133'h1414734d57cdd3963f81850e56458e80c4;
      expv[43] = 133'h02478a455cc4facb446ac5fd3a74941fa1;
      expv[44] = 133'h02478a455cc4facb446ac5fd3a74941fa1;
      expv[45] = 133'h14149ddc1a693f7e4526ea7a84a7eac571;
      expv[46] = 133'h0bdc2ed7efb1f923d7a9e672c601865fda;
      expv[47] = 133'h1c96ef7fc99793aff1458731bd789d274a;
      expv[48] = 133'h1c96ef7fc99793aff1458731bd789d274a;
      expv[49] = 133'h1c96ef7fc99793aff1458731bd789d274a;
      expv[50] = 133'h14c8941f4c013aa45bae710652e660bda6;
      expv[51] = 133'h14c8941f4c013aa45bae710652e660bda6;
      expv[52] = 133'h1e1b1402338d9a573f49a334fb8249e504;
      expv[53] = 133'h02a82c101fb9a5b8ec854dcc8384aff2a0;
      expv[54] = 133'h01e60c45f0d9dd8bc28f5aff06ddfa2a27;
      expv[55] = 133'h02e6dd49821f1beb028ae0f60089f8c9d9;
      expv[56] = 133'h1f10f80c49399ff6466953095417e85cec;
      expv[57] = 133'h1f10f80c49399ff6466953095417e85cec;
      expv[58] = 133'h1f10f80c49399ff6466953095417e85cec;
      expv[59] = 133'h01f1fc8e19c157032516aee0fd4e56e685;
      expv[60] = 133'h01f1fc8e19c157032516aee0fd4e56e685;
      expv[61] = 133'h01f1fc8e19c157032516aee0fd4e56e685;
      expv[62] = 133'h01f1fc8e19c157032516aee0fd4e56e685;
      expv[63] = 133'h0ed3753a7d36b084b39d144feccc710333;
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
