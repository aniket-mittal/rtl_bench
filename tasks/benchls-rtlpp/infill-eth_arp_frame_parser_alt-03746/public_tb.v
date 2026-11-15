// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 190;
  localparam OW = 342;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03746 dut (
    .clk(clk),
    .rst(in_vec[189:189]),
    .s_eth_hdr_valid(in_vec[188:188]),
    .s_eth_dest_mac(in_vec[187:140]),
    .s_eth_src_mac(in_vec[139:92]),
    .s_eth_type(in_vec[91:76]),
    .s_eth_payload_axis_tdata(in_vec[75:12]),
    .s_eth_payload_axis_tkeep(in_vec[11:4]),
    .s_eth_payload_axis_tvalid(in_vec[3:3]),
    .s_eth_payload_axis_tlast(in_vec[2:2]),
    .s_eth_payload_axis_tuser(in_vec[1:1]),
    .m_frame_ready(in_vec[0:0]),
    .s_eth_hdr_ready(out_vec[341:341]),
    .s_eth_payload_axis_tready(out_vec[340:340]),
    .m_frame_valid(out_vec[339:339]),
    .m_eth_dest_mac(out_vec[338:291]),
    .m_eth_src_mac(out_vec[290:243]),
    .m_eth_type(out_vec[242:227]),
    .m_arp_htype(out_vec[226:211]),
    .m_arp_ptype(out_vec[210:195]),
    .m_arp_hlen(out_vec[194:187]),
    .m_arp_plen(out_vec[186:179]),
    .m_arp_oper(out_vec[178:163]),
    .m_arp_sha(out_vec[162:115]),
    .m_arp_spa(out_vec[114:83]),
    .m_arp_tha(out_vec[82:35]),
    .m_arp_tpa(out_vec[34:3]),
    .busy(out_vec[2:2]),
    .error_header_early_termination(out_vec[1:1]),
    .error_invalid_header(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 190'h2de23de4520cc51ff7460066f04ab5e0a29a6170afc6e411;
    stim[1] = 190'h3fb32d2614b1b8ed64b7c2f89853a3b1368c485d12bf956a;
    stim[2] = 190'h08bfa5fd034076d782317eabeb7765443bc344fb65d02eb8;
    stim[3] = 190'h179e0d952dee0826dd6d96b3d9c71d019ba454c08bcdb4c7;
    stim[4] = 190'h0f8920da419d5f59a1bcc5c3a62288edffc579895575fe21;
    stim[5] = 190'h1ec56a7a1812973636f5c6ef55ffea296e9693efcd672540;
    stim[6] = 190'h13fe805a0bc00ef5b5aba2592d26b38af8a15d54c3b3d5e2;
    stim[7] = 190'h03763ca91a9ee915b4b296768a3d9723fa1a4b878dff154e;
    stim[8] = 190'h0393e4d2587ee3732d652fb643f856f5418501d0cd7426b8;
    stim[9] = 190'h14a0ed0d85341b2f936b74977124e705243385d18b74bfa6;
    stim[10] = 190'h0945023a22c026154d6e20f2859323cf956d4bdad2308fd7;
    stim[11] = 190'h192775ae5a62797026cb20fe96b89ac8e1e0be7901c566aa;
    stim[12] = 190'h036fd95cabdf82305a20e63122b68b8ced727b7b9c67e9a3;
    stim[13] = 190'h09ee4fb88fb1ce8a60f283d1c7e112ce6d212bbf9b12014d;
    stim[14] = 190'h0f4459547c82ad39d80d7c04f9828dba838e5ef9d46fa254;
    stim[15] = 190'h10362f007c8c6ab5e6e807777e7dec98e3b5d44dd4596d0b;
    stim[16] = 190'h1816cb7efb234fdc1823eaecf70c441eb0482b56a348f8be;
    stim[17] = 190'h0ba121497a3453152a3b41e835471f443fe737f583441617;
    stim[18] = 190'h1068d6cfeb6207b4611736eb94609d9e451de5c24226c6a3;
    stim[19] = 190'h185067e7fa709e8fbce07820030d68b41765cfd2eee40265;
    stim[20] = 190'h0496061dc69d61f6e64723f19f9c18698edcbb4dde1bcd2c;
    stim[21] = 190'h05b803ddaf870e3d5505f7706cf9f6b49924ecdcf464db70;
    stim[22] = 190'h07d5288bf6f5abed3c7604e28af842cdc536d10bb9cb3bea;
    stim[23] = 190'h186138eb6e8f7f02d9a43ba95e4250ee9b90defd75eb8671;
    stim[24] = 190'h0db538163d88d99eae65b5eaea84d0cc759e8c3cea9249f5;
    stim[25] = 190'h19160c7d0a05293109e6a59686f5fdc77e21342181570f27;
    stim[26] = 190'h083bbd3d9f50bf7943b8d50feadfde979f382258281951c8;
    stim[27] = 190'h08122acad393bc24025e1c531c5dabb72b248ecb0f680547;
    stim[28] = 190'h030f477543c13347159aa61ba6b4fe8bb9d699611728cfa8;
    stim[29] = 190'h120f1deacf97c0a0c6722d311a5d629ec216ca53e371e803;
    stim[30] = 190'h131cdbd2c6a50000fb3a1c894a349b576fbf0bbb783c47ca;
    stim[31] = 190'h047e382b6cf9c112e79caa7bf818e2126aaef55d5312cab8;
    stim[32] = 190'h07634faf35e6d54ab207dbd60e4d91031337358bde6dd48c;
    stim[33] = 190'h15420a28ce8d77f94d5d0defecf6942e85c6a6b82130ae0f;
    stim[34] = 190'h05c8c89de6b7c37b40589d233863dc3aa7c755ccdde44e10;
    stim[35] = 190'h111a40c08a3f842b85019876af0ae823717e06f4ef545ce1;
    stim[36] = 190'h0aebcc9a12aeec8589e442af1b1ab98e3ded50c974da0d03;
    stim[37] = 190'h04c9c323a977818f791eb62945eca7b3494f4d5422bab954;
    stim[38] = 190'h0731c1884adf242a7892dd4dd7c0836e8094899e486c7c65;
    stim[39] = 190'h0d03bde493182d07ea5078b96974e5fa560726de4e1ec165;
    stim[40] = 190'h0ca154386d318d8946d6631c9c7402b0093479191b2dd380;
    stim[41] = 190'h05988b488bf02f00e19dd52e4a8693d2e27c65da1252a665;
    stim[42] = 190'h1c8c1883090fbf699d18278104fbd51e783f49166c2a6c8b;
    stim[43] = 190'h016426de048ef0578096ab06fd193da509fdce27e2e8a43d;
    stim[44] = 190'h0f9c6d0fbbd76ed576fb43e16d3120833ccb912bcf2bb5cc;
    stim[45] = 190'h21b5aa6a7c37ac1b646fbb2bf39d3153f1c3036bad508384;
    stim[46] = 190'h1e8b89ab1564b88ccb0f855a7adf5eb572584606defdd085;
    stim[47] = 190'h1084776d5264ad63393cc8bf875b52e59f287e4324f61ba4;
    stim[48] = 190'h00875d7764f615bb9f9fcc1d5b60ae9291a5a422047e1295;
    stim[49] = 190'h1ab758db9ec7e3188dd560494f824e95a232f7fcd901dd8d;
    stim[50] = 190'h1c5e449fe5b70fb35df44914e95c1cc7b59744e9e1e6c52d;
    stim[51] = 190'h0cbf29d7ff0a2816d3bcb157c11dbb11cd19815b0302a3de;
    stim[52] = 190'h00e59435256f65f2753f3f7902e5041b5fadda0ee55f7222;
    stim[53] = 190'h016220dba7e4ed076286528cb7495b6d9e8da6c9e2945583;
    stim[54] = 190'h1feb71398b6681f52cee1ff893d5c838058121cc24b3e853;
    stim[55] = 190'h03ba9b0ecc1c48d93d2a0d50f7ffd2e5514d102d2281b65d;
    stim[56] = 190'h1a111671317dfd4a5062f5725818369c13c1f72a946aab0d;
    stim[57] = 190'h135ea2734cd054b282091b70aaf1a3f63866cf617f1c65f7;
    stim[58] = 190'h0c589a5a94ad394d8dc00e8c3a92877013b7c98e93f5bdd9;
    stim[59] = 190'h08dac4d21eab820ecde4be7250cdc25c09e909ff5ab459c2;
    stim[60] = 190'h12487fc9ef10b6af5083b81bd792ae60485ddddc4f2bb5c1;
    stim[61] = 190'h0141fc7408417611f629eeb68722b76f7f5df7118c2073b3;
    stim[62] = 190'h3c8f1ef590dbd4cf4391a682694b3dbab45b3f7b7a303cc2;
    stim[63] = 190'h1129fff2788a4dd741595a2b9d0f6cd419fa98b936628332;
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
      expv[0] = 342'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[1] = 342'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[2] = 342'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[3] = 342'h20000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[4] = 342'h13cf06ca96f704136eb6cb59ece38800000000000000000000000000000000000000000000000000000004;
      expv[5] = 342'h13cf06ca96f704136eb6cb59ece38800000000000000000000000000000000000000000000000000000004;
      expv[6] = 342'h13cf06ca96f704136eb6cb59ece38800000000000000000000000000000000000000000000000000000004;
      expv[7] = 342'h13cf06ca96f704136eb6cb59ece38800000000000000000000000000000000000000000000000000000004;
      expv[8] = 342'h23cf06ca96f704136eb6cb59ece38f8efbc5c52509fb900000000000000000000000000000000000000002;
      expv[9] = 342'h23cf06ca96f704136eb6cb59ece38f8efbc5c52509fb900000000000000000000000000000000000000000;
      expv[10] = 342'h12507686c29a0d97c9b5ba4bb892778efbc5c52509fb900000000000000000000000000000000000000004;
      expv[11] = 342'h12507686c29a0d97c9b5ba4bb892778efbc5c52509fb900000000000000000000000000000000000000004;
      expv[12] = 342'h12507686c29a0d97c9b5ba4bb89272b0e4873858f475600000000000000000000000000000000000000004;
      expv[13] = 342'h12507686c29a0d97c9b5ba4bb89272b0e4873858f475600000000000000000000000000000000000000004;
      expv[14] = 342'h22507686c29a0d97c9b5ba4bb89272b0e4873858f47561058fcdd896973160000000000000000000000002;
      expv[15] = 342'h22507686c29a0d97c9b5ba4bb89272b0e4873858f47561058fcdd896973160000000000000000000000000;
      expv[16] = 342'h101b17803e46355af37403bbbf3ef2b0e4873858f47561058fcdd896973160000000000000000000000004;
      expv[17] = 342'h201b17803e46355af37403bbbf3ef479a355ac10275a09058fcdd896973160000000000000000000000002;
      expv[18] = 342'h201b17803e46355af37403bbbf3ef479a355ac10275a09058fcdd896973160000000000000000000000000;
      expv[19] = 342'h10346b67f5b103da308b9b75ca304c79a355ac10275a09058fcdd896973160000000000000000000000004;
      expv[20] = 342'h10346b67f5b103da308b9b75ca304c79a355ac10275a09058fcdd896973160000000000000000000000004;
      expv[21] = 342'h20346b67f5b103da308b9b75ca304de70eeda65f6cc431058fcdd896973160000000000000000000000002;
      expv[22] = 342'h20346b67f5b103da308b9b75ca304de70eeda65f6cc431058fcdd896973160000000000000000000000000;
      expv[23] = 342'h20346b67f5b103da308b9b75ca304de70eeda65f6cc431058fcdd896973160000000000000000000000000;
      expv[24] = 342'h14309c75b747bf816cd21dd4af212de70eeda65f6cc431058fcdd896973160000000000000000000000004;
      expv[25] = 342'h14309c75b747bf816cd21dd4af212de70eeda65f6cc431058fcdd896973160000000000000000000000004;
      expv[26] = 342'h14309c75b747bf816cd21dd4af212de70eeda65f6cc431058fcdd896973160000000000000000000000004;
      expv[27] = 342'h14309c75b747bf816cd21dd4af212cac0c112c179bcf49058fcdd896973160000000000000000000000004;
      expv[28] = 342'h14309c75b747bf816cd21dd4af212cac0c112c179bcf49058fcdd896973160000000000000000000000004;
      expv[29] = 342'h14309c75b747bf816cd21dd4af212cac0c112c179bcf4c63908cb34ceddf40000000000000000000000004;
      expv[30] = 342'h14309c75b747bf816cd21dd4af212cac0c112c179bcf4c63908cb34ceddf40000000000000000000000004;
      expv[31] = 342'h14309c75b747bf816cd21dd4af212cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a800000004;
      expv[32] = 342'h14309c75b747bf816cd21dd4af212cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[33] = 342'h24309c75b747bf816cd21dd4af212cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaa9;
      expv[34] = 342'h12a105146746bbfca6ae86f7f67b4cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[35] = 342'h12a105146746bbfca6ae86f7f67b4cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[36] = 342'h12a105146746bbfca6ae86f7f67b4cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[37] = 342'h12a105146746bbfca6ae86f7f67b4cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[38] = 342'h12a105146746bbfca6ae86f7f67b4cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[39] = 342'h12a105146746bbfca6ae86f7f67b4cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[40] = 342'h12a105146746bbfca6ae86f7f67b4cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[41] = 342'h12a105146746bbfca6ae86f7f67b4cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[42] = 342'h12a105146746bbfca6ae86f7f67b4cac0c112c179bcf4c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[43] = 342'h12a105146746bbfca6ae86f7f67b4d3613348fa41f3a8c63908cb34ceddf46241dbddf87dbb5a9618eaaac;
      expv[44] = 342'h22a105146746bbfca6ae86f7f67b4d3613348fa41f3a8c5173f716e4fa86d6241dbddf87dbb5a9618eaaaa;
      expv[45] = 342'h22a105146746bbfca6ae86f7f67b4d3613348fa41f3a8c5173f716e4fa86d6241dbddf87dbb5a9618eaaa8;
      expv[46] = 342'h22a105146746bbfca6ae86f7f67b4d3613348fa41f3a8c5173f716e4fa86d6241dbddf87dbb5a9618eaaa8;
      expv[47] = 342'h1745c4d58ab25c466587c2ad3d6fad3613348fa41f3a8c5173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[48] = 342'h1745c4d58ab25c466587c2ad3d6fad3613348fa41f3a8c5173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[49] = 342'h1745c4d58ab25c466587c2ad3d6fad3613348fa41f3a8c5173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[50] = 342'h2745c4d58ab25c466587c2ad3d6fa8ec866bf9791ad74c5173f716e4fa86d6241dbddf87dbb5a9618eaaaa;
      expv[51] = 342'h162f224ff2db87d9aefa248a74ae08ec866bf9791ad74c5173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[52] = 342'h262f224ff2db87d9aefa248a74ae09518580acc688e58c5173f716e4fa86d6241dbddf87dbb5a9618eaaaa;
      expv[53] = 342'h262f224ff2db87d9aefa248a74ae09518580acc688e58c5173f716e4fa86d6241dbddf87dbb5a9618eaaa8;
      expv[54] = 342'h262f224ff2db87d9aefa248a74ae09518580acc688e58c5173f716e4fa86d6241dbddf87dbb5a9618eaaa8;
      expv[55] = 342'h17f5b89cc5b340fa96770ffc49eae1518580acc688e58c5173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[56] = 342'h27f5b89cc5b340fa96770ffc49eae0d946901688a2a9745173f716e4fa86d6241dbddf87dbb5a9618eaaaa;
      expv[57] = 342'h15088b3898befea528317ab92c0c18d946901688a2a9745173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[58] = 342'h15088b3898befea528317ab92c0c18d946901688a2a9745173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[59] = 342'h15088b3898befea528317ab92c0c1ad9ff4cc3e1d80bbc5173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[60] = 342'h15088b3898befea528317ab92c0c1ad9ff4cc3e1d80bbc5173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[61] = 342'h15088b3898befea528317ab92c0c1ad9ff4cc3e1d80bbc5173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[62] = 342'h15088b3898befea528317ab92c0c1ad9ff4cc3e1d80bbc5173f716e4fa86d6241dbddf87dbb5a9618eaaac;
      expv[63] = 342'h05088b3898befea528317ab92c0c1ad9ff4cc3e1d80bbc5173f716e4fa86d6241dbddf87dbb5a9618eaaa8;
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
