// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 153;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03992 dut (
    .clk(clk),
    .state_fetch(in_vec[152:152]),
    .ob(in_vec[151:120]),
    .r(in_vec[119:88]),
    .alu(in_vec[87:55]),
    .ir(in_vec[54:6]),
    .aeqm(in_vec[5:5]),
    .destintctl(in_vec[4:4]),
    .nopa(in_vec[3:3]),
    .sintr(in_vec[2:2]),
    .vmaok(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .int_enable(out_vec[4:4]),
    .jcond(out_vec[3:3]),
    .lc_byte_mode(out_vec[2:2]),
    .prog_unibus_reset(out_vec[1:1]),
    .sequence_break(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 153'h1ebfae95a6ef523494f8ecdbc4de56caad27eef;
    stim[1] = 153'h0af5e215a40f51642821db89828022af9e00a39;
    stim[2] = 153'h0f225c45bd9e3f7336efd4f49acc7dd7f27cb34;
    stim[3] = 153'h04081e83555c4a11be67b7a0c8a4c935d54e149;
    stim[4] = 153'h08914fa32d27d02b2341d588211ae4ae323e49a;
    stim[5] = 153'h08d00011c9bb0b529247f7b8e839a89b04f0f64;
    stim[6] = 153'h0c051b2edad94f9e755e301ea5798ac36d4ef7a;
    stim[7] = 153'h0d00d9080a0c8e40d6cfe717f675ed041ec1e5a;
    stim[8] = 153'h1bd50c989737cf857df5a42073a9728054a44a0;
    stim[9] = 153'h052fe74016da2a8d5ff7259bcf17731f425a994;
    stim[10] = 153'h065f10b02cdbf59bfefd95c796ff9a25d67a98c;
    stim[11] = 153'h1a8647421f6eb156e38956b23d49bcdc43ffd4a;
    stim[12] = 153'h0d735558ace5d29c3cd1abf05decb87b0ac1d6e;
    stim[13] = 153'h0236fc92d91c0e2d99dd6941a99ee025de8b94e;
    stim[14] = 153'h0db5b431b592a841eb6d732d727e198e63d77fe;
    stim[15] = 153'h02ec5ed4e9af7dbb2a12bb370dd203be293494e;
    stim[16] = 153'h02a8556216ce1e810781ec6467a673699e5da70;
    stim[17] = 153'h1aea5131b972ed333bcb868cbda358524f0bbf6;
    stim[18] = 153'h191614c6bc15a20d91516fde292fafc2a4a0180;
    stim[19] = 153'h1236b32920d66bd5a388291d3dd6d1132e54aca;
    stim[20] = 153'h088566790bb02a663b6d391fb34b7bc7f164d54;
    stim[21] = 153'h05373f30b825445c161656e225a421408acfdb0;
    stim[22] = 153'h00399c9d99770d46e6c75fed816769f5cc41ce0;
    stim[23] = 153'h14ffaddf70164644d6244aa75d8bbdca937f50e;
    stim[24] = 153'h0c4f04d0cffb31f2648943c766df1762d896596;
    stim[25] = 153'h0884066bfe2d143dbb741fd8fc2a362746e4ffa;
    stim[26] = 153'h19fd7d4a19ebebb3967818470a69e0b516ccefe;
    stim[27] = 153'h194188b1203abcf2caf6ab0c7f5356dc2ab6380;
    stim[28] = 153'h18e53388b881cf6dfe9b32fb0cd6153ff94b5f4;
    stim[29] = 153'h151a71c143678bbde2cac76751a1b70ce9fe420;
    stim[30] = 153'h1730e2d7474642fe1ad6ac1467496341517345a;
    stim[31] = 153'h11ec0f0389653a3a4d9c879271c42195de75fec;
    stim[32] = 153'h1eaf1e16cc927dc34caf34172288e121684e570;
    stim[33] = 153'h0b333c1f3e636603505a04c4215ebab5f975782;
    stim[34] = 153'h1fedde115824832ee4c4ce1103138ffa35f5410;
    stim[35] = 153'h0606f8b55463f4639b989955a87dc0a5c5e9e4a;
    stim[36] = 153'h10d0f2060460a923482eda40732a7e96933e236;
    stim[37] = 153'h194a6e5d32772bf195266d652e4309c097f1e90;
    stim[38] = 153'h1b3a5bae55e83848d6756ed3e7d2188a9732950;
    stim[39] = 153'h0c1e28434ec7d9c0d177753387b49aeec4430d8;
    stim[40] = 153'h1992a75bd517c2d97aa644ff11b4d9231aa3c5a;
    stim[41] = 153'h1f63e272991957b3aaaf4ea75acdb2a3d282ce6;
    stim[42] = 153'h00f20209a004a8b0022055f237fe7c8e706fd6c;
    stim[43] = 153'h1d2848156ee3a34bf3de5f0ddb1939c43dad5e0;
    stim[44] = 153'h0ae9e8043a11f5f6cae9e1d44c0ea9743291680;
    stim[45] = 153'h0c2bad69569ca53d219c59d18dc578b0d97ef64;
    stim[46] = 153'h053847ae53c3437f80965c37a498cdb08640620;
    stim[47] = 153'h1e44f856075012e1afd28c89baf706cf34010f6;
    stim[48] = 153'h0ee2556d78792a5c3e2c49016b19d3a8d3a2edc;
    stim[49] = 153'h008fd9bde9772e5578109feaf57468fdd6dc3a6;
    stim[50] = 153'h1564ffc051cf0a6c198c609b8239ba6131657a8;
    stim[51] = 153'h01f91114153a467908347e5c64a711bb7b86ab8;
    stim[52] = 153'h138af16b54ecdb99e45f08fdc815c94d58fbe46;
    stim[53] = 153'h1bf576cd84ba42272a91ccfee2b4ad9874102fe;
    stim[54] = 153'h15d10ae24ae3c1cd43f25066dc62627bc8aa586;
    stim[55] = 153'h1e2457b444121df9e9ce32c93d813775cd2d9a8;
    stim[56] = 153'h0332c1d7ae56a4bd8196e644f33bd21e7bfd870;
    stim[57] = 153'h195a2a3923f71866a1d278507117521f9b830c6;
    stim[58] = 153'h1fecdc59a80fecf1b315fdbd7899fed95a8499c;
    stim[59] = 153'h1244006e1dca6fea61ea7f9eaec72c514b27a8a;
    stim[60] = 153'h0b6a37d03a655a6ed88a10828d6bbe1f66c7ea2;
    stim[61] = 153'h12d56b1320fb49edfe631e82222064e70da6598;
    stim[62] = 153'h040625d4313f279874685b74465356cd2c315b6;
    stim[63] = 153'h183b7dcede28ce86e75322fc7aede1924945ffe;
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
      expv[0] = 5'h08;
      expv[1] = 5'h00;
      expv[2] = 5'h08;
      expv[3] = 5'h08;
      expv[4] = 5'h00;
      expv[5] = 5'h08;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h08;
      expv[9] = 5'h08;
      expv[10] = 5'h08;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h08;
      expv[18] = 5'h1d;
      expv[19] = 5'h15;
      expv[20] = 5'h1d;
      expv[21] = 5'h1d;
      expv[22] = 5'h1d;
      expv[23] = 5'h1d;
      expv[24] = 5'h15;
      expv[25] = 5'h1d;
      expv[26] = 5'h1d;
      expv[27] = 5'h13;
      expv[28] = 5'h1b;
      expv[29] = 5'h11;
      expv[30] = 5'h19;
      expv[31] = 5'h0e;
      expv[32] = 5'h06;
      expv[33] = 5'h1c;
      expv[34] = 5'h14;
      expv[35] = 5'h1f;
      expv[36] = 5'h17;
      expv[37] = 5'h11;
      expv[38] = 5'h0b;
      expv[39] = 5'h0e;
      expv[40] = 5'h0e;
      expv[41] = 5'h1a;
      expv[42] = 5'h1a;
      expv[43] = 5'h1a;
      expv[44] = 5'h12;
      expv[45] = 5'h1a;
      expv[46] = 5'h12;
      expv[47] = 5'h12;
      expv[48] = 5'h05;
      expv[49] = 5'h0d;
      expv[50] = 5'h0d;
      expv[51] = 5'h0d;
      expv[52] = 5'h05;
      expv[53] = 5'h05;
      expv[54] = 5'h17;
      expv[55] = 5'h1f;
      expv[56] = 5'h17;
      expv[57] = 5'h17;
      expv[58] = 5'h1f;
      expv[59] = 5'h17;
      expv[60] = 5'h1f;
      expv[61] = 5'h1f;
      expv[62] = 5'h1d;
      expv[63] = 5'h1d;
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
