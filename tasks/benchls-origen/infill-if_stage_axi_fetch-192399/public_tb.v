// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 154;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_192399 dut (
    .clk(clk),
    .rst(in_vec[106:106]),
    .DSI_ID(in_vec[105:105]),
    .IRWrite(in_vec[104:104]),
    .PC_buffer(in_vec[103:72]),
    .PC_AdEL(in_vec[71:71]),
    .PC_abnormal(in_vec[70:70]),
    .inst_sram_rdata(in_vec[69:38]),
    .do_load(in_vec[37:37]),
    .data_req(in_vec[36:36]),
    .decode_allowin(in_vec[35:35]),
    .fetch_axi_ar_ready(in_vec[34:34]),
    .fetch_axi_r_valid(in_vec[33:33]),
    .fetch_axi_r_data(in_vec[32:1]),
    .fetch_axi_r_last(in_vec[0:0]),
    .PC_IF_ID(out_vec[153:122]),
    .PC_add_4_IF_ID(out_vec[121:90]),
    .IR_IF_ID(out_vec[89:58]),
    .PC_AdEL_IF_ID(out_vec[57:57]),
    .DSI_IF_ID(out_vec[56:56]),
    .PC_fresh(out_vec[55:55]),
    .fetch_axi_ar_valid(out_vec[54:54]),
    .fetch_axi_ar_addr(out_vec[53:22]),
    .fetch_axi_ar_len(out_vec[21:14]),
    .fetch_axi_ar_size(out_vec[13:11]),
    .fetch_axi_ar_burst(out_vec[10:9]),
    .fetch_axi_ar_cache(out_vec[8:5]),
    .fetch_axi_ar_prot(out_vec[4:2]),
    .fetch_axi_r_ready(out_vec[1:1]),
    .data_rdata_ok(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h6e8c57ee199c9e1c7da1b1b76b6;
    stim[1] = 107'h44f0471d6fa77a05e8b63cfddc8;
    stim[2] = 107'h25ad57f8b7350b8b566dab07608;
    stim[3] = 107'h01779da90bd6c5db6f88d60c3c0;
    stim[4] = 107'h0489cdcba00fc2ff7dcea76166c;
    stim[5] = 107'h1cc52d4f15ffbc3a518af731c2b;
    stim[6] = 107'h2b6252e62065475845ad0a7ca57;
    stim[7] = 107'h005165b133018af57606f75be5b;
    stim[8] = 107'h2a0c53cc2484dbfbf36e767f974;
    stim[9] = 107'h20ce94ecfbb03a93c6d6d810096;
    stim[10] = 107'h113b8bfd3dc9857a64ebcddcaff;
    stim[11] = 107'h3c67fad8b554b9c016dd17b8240;
    stim[12] = 107'h358f6e166a0b954f8b072936c13;
    stim[13] = 107'h26d9be6e40a164297aeef748824;
    stim[14] = 107'h64c2bee6f7a8b3dc0e13db863b3;
    stim[15] = 107'h1e1053dcf93a2e531e29ada7efe;
    stim[16] = 107'h26e70691d7991698ad2e9c9b5df;
    stim[17] = 107'h284f301a7adfbcff92e433f54b4;
    stim[18] = 107'h19c204a10d4974e4c1b7aea58e0;
    stim[19] = 107'h325cca0e892a2a8e944923c5e71;
    stim[20] = 107'h13fda137a948e69be64ae15470b;
    stim[21] = 107'h3dde8b3da483ed8490c04fe1ead;
    stim[22] = 107'h04b61f099b54a8f19ab479689c3;
    stim[23] = 107'h3a973fde82773f530790f70065d;
    stim[24] = 107'h1486264b7e4157a70b3055de21a;
    stim[25] = 107'h2df73120da78a6c5db9ab2bf249;
    stim[26] = 107'h09f3004f4eaf3c71e72bfa5ab89;
    stim[27] = 107'h084dc8987f075f5aa51c7f2a57c;
    stim[28] = 107'h391e84e22ebce47b467151ec162;
    stim[29] = 107'h397333eca68607c3d87357cf297;
    stim[30] = 107'h03f393a621c30ed1aa2dad20a0f;
    stim[31] = 107'h10343c9ba32ed241f13c5c42c5e;
    stim[32] = 107'h0f3cad2c82b717bf3a4c1bd0229;
    stim[33] = 107'h29de15d90d4339e4e6989913b84;
    stim[34] = 107'h3dda20acfc3d2ca4ca910fecb5c;
    stim[35] = 107'h18796cfc8eba3f9e225bcbb5c3b;
    stim[36] = 107'h2962eab60625bee335565ea1195;
    stim[37] = 107'h3ea17ceaf0dc382a4125663a72f;
    stim[38] = 107'h043f8aaba51c536043799c52fbf;
    stim[39] = 107'h3b043aea704fead56d9b46888ba;
    stim[40] = 107'h1a4f3d5722ed7c9640f7a4a88d3;
    stim[41] = 107'h3c57047f3c8dae3d8ba5fa8978e;
    stim[42] = 107'h1d9a2e0a1f29668e4cbedfb1e98;
    stim[43] = 107'h281dcb07b19b751ef99a62110b7;
    stim[44] = 107'h3c53aeec0895df0aa425347e32b;
    stim[45] = 107'h37dcb39dd169d0785bb15577a12;
    stim[46] = 107'h3ec14cde789c972df55678e30ae;
    stim[47] = 107'h193c3fbc645f3468b2788de32b7;
    stim[48] = 107'h1c0e0e342d92dc5a6dd31c4b811;
    stim[49] = 107'h1c2400d10639773dc875fdd0e46;
    stim[50] = 107'h09eb83a972ef9d7c0603f36e93c;
    stim[51] = 107'h138b50adc5e04e287b5f165a2cf;
    stim[52] = 107'h246a6874cb1d82f3570dabb644c;
    stim[53] = 107'h0d7aac09ae079f689140556b3f9;
    stim[54] = 107'h346e275cb2b5b94c8ce44fea22f;
    stim[55] = 107'h11105924321b856beb0a5761478;
    stim[56] = 107'h23ce4f1c7f03e28a225faa9fc89;
    stim[57] = 107'h167766932c62102b51756e7a76f;
    stim[58] = 107'h382a34001fcb903c9cb072bf0ae;
    stim[59] = 107'h17ee2045e1eaf2826947e281db4;
    stim[60] = 107'h116cc246ac360cf1a0bbcc7ee57;
    stim[61] = 107'h11907d6e631fdc20a278efffaac;
    stim[62] = 107'h364983f2218c21d9e779acda678;
    stim[63] = 107'h1bc7674b8332f00310c2f262e17;
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
      expv[0] = 154'hxxxxxxxxxxxxxxxxxxxxxxxxxxa315fb8401202;
      expv[1] = 154'h000000000000000000000000013c11c75801202;
      expv[2] = 154'h000000000000000000000000056b55fe2c01202;
      expv[3] = 154'h00000000000000001b560ec1005de76a4001202;
      expv[4] = 154'h05de76a405de76a51b560ec129227372e801202;
      expv[5] = 154'h1227372e9227372f9b560ec10b314b53c401202;
      expv[6] = 154'h3314b53c7314b53d5b560ec10ad894b98801203;
      expv[7] = 154'h2d894b98ad894b999a14f94adc14596c4c01202;
      expv[8] = 154'h2d894b98ad894b999a14f94ad68314f30801202;
      expv[9] = 154'h2d894b98ad894b999cecff2e9033a53b3c01202;
      expv[10] = 154'h033a53b3c33a53b4dcecff2eb84ee2ff4c01203;
      expv[11] = 154'h04ee2ff4c4ee2ff5d79bb95feb19feb62c01202;
      expv[12] = 154'h319feb62f19feb63d79bb95fdd63db859801202;
      expv[13] = 154'h319feb62f19feb63d79bb95fd1b66f9b9001202;
      expv[14] = 154'h1b66f9b91b66f9ba1dee91049d30afb9bc01202;
      expv[15] = 154'h000000000000000000000000078414f73c01202;
      expv[16] = 154'h0000000000000000135b4fdfc5b9c1a47401203;
      expv[17] = 154'h00000000000000001d3936bbc213cc069c01202;
      expv[18] = 154'h213cc069e13cc06ac867ea96ba7081284001202;
      expv[19] = 154'h27081284270812852f5d4b1c2c973283a001202;
      expv[20] = 154'h27081284270812852f5d4b1c24ff684de801202;
      expv[21] = 154'h27081284270812852f5d4b1c2377a2cf6801202;
      expv[22] = 154'h377a2cf6b77a2cf7af5d4b1c192d87c26401203;
      expv[23] = 154'h12d87c2652d87c2768f2d1386aa5cff7a001202;
      expv[24] = 154'h2a5cff7a2a5cff7b28f2d1385d218992dc01202;
      expv[25] = 154'h2a5cff7a2a5cff7b20abbc43537dcc483401202;
      expv[26] = 154'h37dcc48377dcc48460abbc437e7cc013d001203;
      expv[27] = 154'h37dcc48377dcc48457f4b571361372261c01202;
      expv[28] = 154'h37dcc48377dcc48457f4b5713647a1388801202;
      expv[29] = 154'h37dcc48377dcc48462a3d82c765cccfb2801203;
      expv[30] = 154'h37dcc48377dcc48466af9e52f4fce4e98801203;
      expv[31] = 154'h37dcc48377dcc4845b5a4141f40d0f26e801202;
      expv[32] = 154'h37dcc48377dcc48478b8858bf7cf2b4b2001202;
      expv[33] = 154'h37dcc48377dcc48478b8858bf27785764001202;
      expv[34] = 154'h277857642778576538b8858bfb76882b3c01202;
      expv[35] = 154'h376882b3f76882b4f8b8858bfe1e5b3f2001202;
      expv[36] = 154'h376882b3f76882b4f8b8858bf658baad8001202;
      expv[37] = 154'h376882b3f76882b4f8b8858bf7a85f3abc01203;
      expv[38] = 154'h376882b3f76882b4cacc74e5f50fe2aae801203;
      expv[39] = 154'h376882b3f76882b4f338a5f7f2c10eba9c01202;
      expv[40] = 154'h2c10eba9ec10ebaaf338a5f7da93cf55c801203;
      expv[41] = 154'h293cf55ca93cf55daf49511a4b15c11fcc01202;
      expv[42] = 154'h315c11fcf15c11fdcbf512f1fb668b828401202;
      expv[43] = 154'h3668b8287668b8297dbf63d32a0772c1ec01202;
      expv[44] = 154'h20772c1ee0772c1ffdbf63d31f14ebbb0001203;
      expv[45] = 154'h20772c1ee0772c1fca68fc6551f72ce77401202;
      expv[46] = 154'h1f72ce775f72ce7862aaef425fb053379c01202;
      expv[47] = 154'h1f72ce775f72ce7862aaef42564f0fef1801203;
      expv[48] = 154'h1f72ce775f72ce78711bc656d303838d0801202;
      expv[49] = 154'h303838d0b03838d1b11bc656ef0900344001202;
      expv[50] = 154'h303838d0b03838d1abfba1c8e67ae0ea5c01202;
      expv[51] = 154'h303838d0b03838d1abfba1c8e4e2d42b7001202;
      expv[52] = 154'h303838d0b03838d1abfba1c8e51a9a1d3001202;
      expv[53] = 154'h303838d0b03838d1abfba1c8e75eab026801202;
      expv[54] = 154'h303838d0b03838d1abfba1c8e11b89d72c01203;
      expv[55] = 154'h11b89d72d1b89d73c89fd445dc4416490c01202;
      expv[56] = 154'h11b89d72d1b89d73c89fd445d4f393c71c01202;
      expv[57] = 154'h11b89d72d1b89d73c89fd445d59dd9a4c801203;
      expv[58] = 154'h11b89d72d1b89d73eadcf4edd20a8d000401202;
      expv[59] = 154'h20a8d00060a8d00160e57e15fdfb88117801202;
      expv[60] = 154'h20a8d00060a8d00160e57e15f05b3091a801203;
      expv[61] = 154'h05b3091a85b3091bb798fdcaec641f5b9801202;
      expv[62] = 154'h05b3091a85b3091bb1dfff55a59260fc8801202;
      expv[63] = 154'h05b3091a85b3091bb359b4cf22f1d9d2e001202;
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
